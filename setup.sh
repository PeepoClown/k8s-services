#!/bin/sh

function start_msg()
{
	echo -e "\e[1;32m [ ] $1\e[0m"
	sleep 1
}

function complete_msg()
{
	echo -e "\e[1;32m [+] \e[1;36m$1\e[0m"
	sleep 1
}

# To enable API bearer tokens to be used to authenticate to the kubelet's HTTPS endpoint
# --extra-config=kubelet.authentication-token-webhook=true

minikube start --vm-driver=docker \
			   --cpus=2 \
			   --memory=4096 \
			   --extra-config=kubelet.authentication-token-webhook=true \
			   --extra-config=apiserver.service-node-port-range=21-30000

minikube addons enable metallb
minikube addons enable metrics-server
minikube addons enable dashboard

eval $(minikube docker-env)

export MINIKUBE_IP=$(minikube ip)

docker build -t nginx_img srcs/nginx/

kubectl apply -f srcs/metallb.yaml
kubectl apply -f srcs/nginx.yaml