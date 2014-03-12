#!/usr/bin/env bash

proxy_conf="/vagrant/ansible/roles/proxy/vars/main.yml"
apt_conf="/etc/apt/apt.conf.d/80proxy"
ansible_conf="/home/vagrant/.ansible.cfg"

sed -i -e 's/\r$//' $proxy_conf

while read line
do
  if [[ $line =~ ^http_proxy:.+$ ]]; then
    arr=($line)
    http_proxy=${arr[1]}
  fi
done < $proxy_conf

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

if ! [ -e $ansible_conf ]; then
  touch $ansible_conf
  echo "[defaults] " >> $ansible_conf
  echo "log_path=/vagrant/ansible.log" >> $ansible_conf
fi

ansible-playbook -i /vagrant/ansible/hosts /vagrant/ansible/playbook.yml -v
