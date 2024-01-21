
# Delete loadbalancer

#$loadbalancer = $(doctl compute load-balancer list -o json | ConvertFrom-Json) 
#doctl compute load-balancer delete $loadbalancer.id -f

# Delete droplet with specific name

#$wordpress = $(doctl compute droplet list -o json | ConvertFrom-Json ) | Where-Object {$_.name -like "*wordpress*"}
#doctl compute droplet delete $wordpress.id -f

$k8s = $(doctl kubernetes cluster list -o json | ConvertFrom-Json ) 
doctl compute droplet delete $k8s.id -f