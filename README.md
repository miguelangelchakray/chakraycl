
# Prepare Nexus , Jenkins , etc.

## Download and update roles

```
ansible-galaxy install --roles-path ./roles -r requirements.yml
```

Deploy 

```
cd vagrant-esx-registry
cd ansible
export ANSIBLE_CONFIG=$PWD/../provisioning/ansible.cfg ; ansible-playbook -i inventory.ini alm.yml
```


# Use the kuberntes cluster 

Set KUBECONFIG

export KUBECONFIG=~/Documents/Chakray/Proyectos/Devops/chakraycl/kubespray/inventory/chakracluter/artifacts/admin.conf

Test it:
```
 kubectl get nodes
```


# 

