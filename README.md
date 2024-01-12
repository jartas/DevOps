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

