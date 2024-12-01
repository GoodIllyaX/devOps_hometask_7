#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt install -y openssh-server

sudo sed -i 's/#GatewayPorts no/GatewayPorts yes/' /etc/ssh/sshd_config

sudo systemctl restart ssh

nohup python3 -m http.server 8000 &