#!/bin/bash

function start_msg()
{
	echo -e "\033[1;34m[...] $1 \033[0m"
}
function complete_msg()
{
	echo -e "\033[1;32m[ + ] $1 \033[0m"
}

function build_image()
{
	if docker build -t $2 $3
	then echo -e "$1 : \033[1;32m[ + ] ok\033[0m"
	else echo -e "$1 : \033[1;31m[ - ] ko\033[0m"
	fi
}

function setup_service()
{
	if kubectl apply -f $2
	then echo -e "$1 : \033[1;32m[ + ] ok\033[0m"
	else echo -e "$1 : \033[1;31m[ - ] ko\033[0m"
	fi
}

start_msg "launch minikube..."
minikube start	--vm-driver=virtualbox \
				--cpus=2 \
				--memory=4096mb \
				--disk-size=10000mb \
				--extra-config=kubelet.authentication-token-webhook=true
complete_msg "finished!"

start_msg "enabling addons..."
minikube addons enable metallb > /dev/null
minikube addons enable metrics-server > /dev/null
minikube addons enable dashboard > /dev/null
complete_msg "finished!"

eval $(minikube docker-env)

kubectl apply -f srcs/metallb-config.yaml > /dev/null
complete_msg "load balancer configured!"

kubectl create secret generic -n metallb-system memberlist \
	--from-literal=secretkey="$(openssl rand -base64 128)" > /dev/null
complete_msg "kubernetes secret generated!"

start_msg "building images..."
build_image "nginx image" nginx_image srcs/nginx
build_image "ftps image" ftps_image srcs/ftps
build_image "mysql image" mysql_image srcs/mysql
build_image "wordpress image" wordpress_image srcs/wordpress
complete_msg "finished!"

start_msg "setup services..."
setup_service "nginx service" srcs/nginx.yaml
setup_service "ftps service" srcs/ftps.yaml
setup_service "mysql volume" srcs/mysql-pv.yaml
setup_service "mysql volume claim" srcs/mysql-pvc.yaml
setup_service "mysql service" srcs/mysql.yaml
setup_service "wordpress service" srcs/wordpress.yaml
complete_msg "finished!"

echo -e "\n\n"
complete_msg "All Done!!!"
