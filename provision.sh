#!/usr/bin/env bash

config=/vagrant/ansible/roles/proxy/vars/main.yml
sed -i -e 's/\r$//' $config

while read line
do
  if [[ $line =~ ^http_proxy:.+$ ]]; then
    arr=($line)
    http_proxy=${arr[1]}
  fi
done < $config

apt_conf="/etc/apt/apt.conf.d/80proxy"

if [ -e $apt_conf ]; then
  sudo rm $apt_conf
fi
if [ -n $http_proxy ]; then
  sudo touch $apt_conf
  echo "Acquire::http::Proxy \"${http_proxy}\";" | sudo tee -a $apt_conf
fi

if ! [ `which ansible` ]; then
  sudo apt-get update -y
  sudo apt-get install -y ansible
fi

ansible-playbook -i /vagrant/ansible/hosts /vagrant/ansible/playbook.yml
