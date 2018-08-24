#!/usr/bin/env bash
export PYTHONUNBUFFERED=1
export ANSIBLE_FORCE_COLOR=1

if [ $(rpm -qa ansible 2>/dev/null | grep -c "ansible") -eq 0 ];
then
    echo ""
    yum -y install epel-release &> /dev/null || exit 1
    echo "Installing Ansible"
    yum -y install ansible &> /dev/null || exit 1
    echo "Ansible installed"
fi

cd /Vagrantfiles/provisioning
#move ansible inventory hosts file into  default location
cp localhost.ini /etc/ansible/hosts
#undo executable bits on synced files since ansible gets grumpy
chmod -X /etc/ansible/hosts
ansible-link playbook.yml 
ansible-playbook playbook.yml -vv
