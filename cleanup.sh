#!/bin/bash

kubectl delete -k deployment/dev/ui-app
kubectl delete -k deployment/dev/keyCloak

cd ./terraform/learn-terraform-provision-eks-cluster
terraform destroy -auto-approve
