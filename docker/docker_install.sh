#!/bin/bash
if [[ $EUID -eq 0 ]]; then
	echo "Você deve rodar esse script como usuario comum" 1>&2
exit 1
fi
sudo su -c" apt remove docker docker-engine docker.io ;
apt update ;
apt install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   'deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable';
apt update;
apt install -y docker-ce docker-compose;
systemctl enable docker"
#groupadd docker
sudo usermod -aG docker $USER
echo "Você precisará reiniciar a sessão para poder usar o docker (logoff)"
