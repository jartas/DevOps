##Deployment k3s 3node cluster include k8s dashboard, longhorn(persisten volume), metallb(looadbalancer), ingress

PREREQUISITES

3node with ubuntu server distribution
ansible on each node
edit host file for ansible environment (ip, username, password)
for metallb(loadbalancer) must be set valid range ip address in ./metallb/matallb.yaml
for correct domain must be set domain for all ingresses in ./k8s_dashboard/manifest.yaml and ./longhorn/manifest.yaml


##Installation for macOS

brew install ansible
brew install sshpass
export ANSIBLE_HOST_KEY_CHECKING=False

#install cluster
ansible-playbook k3s_install.yml --inventory-file=~/hosts

#uninstall cluster
ansible-playbook uninstall.yml --inventory-file=~/hosts

#Kubeconfig

Kubeconfig for external manage cluster is store on each node in "/etc/rancher/k3s/k3s.yaml" folder

copy this file to local machine and edit host address

kubectl get node --kubeconfig *.file
or set env: export KUBECONFIG=/filepath
kubectl get node

#Access to k8s dashboard

https://dashboard.domain.local

for authorization use token which is generate via ansible or use this command for export token

kubectl get secret admin-user -n kubernetes-dashboard -o jsonpath={".data.token"} | base64 -d

#Access to longhorn dashboard

https://longhorn.domain.local
