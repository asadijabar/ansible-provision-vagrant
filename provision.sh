#!/usr/bin/env bash

while read line
do
  if [[ $line =~ ^http_proxy:.+$ ]]; then
    arr=($line)
    export http_proxy=${arr[1]}
  fi
done < /vagrant/ansible/roles/proxy/vars/main.yml

if ! [ `which ansible` ]; then
  apt-get update -y
  apt-get install -y ansible
fi

ansible-playbook -i /vagrant/ansible/hosts /vagrant/ansible/playbook.yml