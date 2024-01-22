 doctl vpcs create --name DevOps --region fra1 --ip-range 10.0.0.0/16
 doctl compute droplet create node1 node2 node3 --size s-2vcpu-4gb --image ubuntu-20-04-x64 --region fra1 --vpc-uuid 7f93843d-3823-4a69-a411-016ad6701ca9 --ssh-keys  24:7e:27:5a:4d:94:00:54:47:00:8c:27:80:d1:36:37 --user-data-file ./cloud_config.conf
 doctl registry create devopsreg