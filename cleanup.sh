#!/bin/bash

kubectl delete -k deployment/dev/ui-app
kubectl delete -k deployment/dev/keyCloak

cd ../terraform/learn-terrfrom-provision-eks-cluster
terraform destroy -auto-approve
