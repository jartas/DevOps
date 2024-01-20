
# Delete loadbalancer

#$loadbalancer = $(doctl compute load-balancer list -o json | ConvertFrom-Json) 
#doctl compute load-balancer delete $loadbalancer.id -f

# Delete droplet with specific name

$droplet = $(doctl compute droplet list -o json | ConvertFrom-Json ) | Where-Object {$_.name -like "*ubuntu*"}
doctl compute droplet delete $droplet.id -f