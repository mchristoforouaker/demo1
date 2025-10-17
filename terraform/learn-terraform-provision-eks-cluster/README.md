# Learn Terraform - Provision an EKS Cluster

This repo is a companion repo to the [Provision an EKS Cluster tutorial](https://developer.hashicorp.com/terraform/tutorials/kubernetes/eks), containing
Terraform configuration files to provision an EKS cluster on AWS.

Every time a new cluster is created you need to update the kubeconfig last this.

```sh
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name) --no-verify-ssl
```

Obviously you call also eplace the dollar bits without interigating the terraform output
NOTE: switched to ECR as github package repgistry cannot be accessed. Well it can but it's a faff

```sh
kubectl create deployment ui-app --image=043505372635.dkr.ecr.eu-west-2.amazonaws.com/nsap/ui-app-runtime:103
```


kubectl create deployment ui-app --image=ghcr.io/mchristoforouaker/ui-app-runtime:102


Deploy App

aws ecr get-login-password --region eu-west-2 --no-verify-ssl | docker login --username AWS --password-stdin 043505372635.dkr.ecr.eu-west-2.amazonaws.com

docker tag ui-app-runtime:latest 043505372635.dkr.ecr.eu-west-2.amazonaws.com/nsap/ui-app-runtime:latest

docker push 043505372635.dkr.ecr.eu-west-2.amazonaws.com/nsap/ui-app-runtime:103

## Gotcha

There appears to be some interaction with zscalar security software so with terraform need to use the switch

```sh
--no-verify-ssl
```


## Actions

Was having trouble pulling images. First got an error 

```sh
Failed to pull image "043505372635.dkr.ecr.eu-west-2.amazonaws.com/nsap/ui-app-runtime:latest": rpc error: code = NotFound desc = failed to pull and unpack image "043505372635.dkr.ecr.eu-west-2.amazonaws.com/nsap/ui-app-runtime:latest": no match for platform in manifest: not found
```

I think this was fixed by setting permission on the ECR as described here...

```sh
https://repost.aws/knowledge-center/eks-ecr-troubleshooting
```

This got me a new error

no match for platform in manifest: not found

This is because the image was built on a Mac, in fact an Apple Silicon Mac.
So it looks like I need to do what is decribed here...

```sh
https://stackoverflow.com/questions/79787348/eks-aws-fargate-imagepullbackoff-due-to-no-match-for-platform-in-manifest-wh
```

Specifically this switch is required in the docker build...

```sh
--platform linux/amd64
```

As AWS EKS Fargate only supports linux/amd64 images.

Pushing this now shows the image as differenet from the others
Will now create a new deployment using this image

THIS WORKED!

```sh
kubectl events

1s                    Normal    Pulled              Pod/ui-app-dd777897b-v99p9     Successfully pulled image "043505372635.dkr.ecr.eu-west-2.amazonaws.com/nsap/ui-app-runtime:103" in 3.628s (3.628s including waiting)
1s                    Normal    Created             Pod/ui-app-dd777897b-v99p9     Created container: ui-app-runtime
1s                    Normal    Started             Pod/ui-app-dd777897b-v99p9     Started container ui-app-runtime
```