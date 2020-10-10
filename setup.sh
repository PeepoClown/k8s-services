#!/bin/bash

function start_msg()
{
	echo -e "\e[1;34m[...] $1 \e[0m"
}
function complete_msg()
{
	echo -e "\e[1;32m[ + ] $1 \e[0m"
}

function build_image()
{
	if docker build -t $2 $3
	then echo -e "$1 : \e[1;32m[ + ] ok\e[0m"
	else echo -e "$1 : \e[1;31m[ - ] ko\e[0m"
	fi
}

function setup_service()
{
	if kubectl apply -f $2
	then echo -e "$1 : \e[1;32m[ + ] ok\e[0m"
	else echo -e "$1 : \e[1;31m[ - ] ko\e[0m"
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
complete_msg "finished!"

start_msg "setup services..."
setup_service "nginx service" srcs/nginx.yaml
complete_msg "finished!"

echo -e "\n\n"
complete_msg "All Done!!!"
