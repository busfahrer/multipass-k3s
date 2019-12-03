#!/bin/sh

multipass launch --name node1
multipass exec node1 -- sh -c "curl -sfL https://get.k3s.io | sh -"

TOKEN=`multipass exec node1 -- sudo cat /var/lib/rancher/k3s/server/node-token`
IP=`multipass list --format csv | grep "^node1" | cut -d, -f3`

for i in `seq 2 $1`
do
  multipass launch --name node$i
  multipass exec node$i -- sh -c "curl -sfL https://get.k3s.io | K3S_URL=https://$IP:6443 K3S_TOKEN=$TOKEN sh -"
done
