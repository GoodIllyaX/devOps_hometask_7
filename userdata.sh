#!/bin/bash

apt-get update -y
apt-get install -y openssh-server

sed -i 's/#GatewayPorts no/GatewayPorts yes/' /etc/ssh/sshd_config

systemctl restart ssh

# Разрешаем входящий трафик на порт 22 (SSH) 
aws ec2 authorize-security-group-ingress --region us-east-1 --group-id SECURITY_GROUP_ID --protocol tcp --port 22 --cidr 0.0.0.0/0

# Разрешаем входящий трафик на порт 8080 (веб-сервер)
aws ec2 authorize-security-group-ingress --region us-east-1 --group-id SECURITY_GROUP_ID --protocol tcp --port 8080 --cidr 0.0.0.0/0

python3 -m http.server 8080 --bind 0.0.0.0 &

echo "Python HTTP server is running on port 8080."