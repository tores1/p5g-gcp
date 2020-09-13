#!/bin/bash

gcloud container clusters create p5g\
	--enable-kubernetes-alpha\
	--cluster-version latest\
	--image-type UBUNTU\
	--enable-ip-alias\
	--no-enable-autorepair\
	--no-enable-autoupgrade\
	--machine-type = n1-standard-2

gcloud container clusters get-credentials p5g

helm install p5g bitnami/mongodb -f mongodb.yaml

# p5g-mongodb.default.svc.cluster.local
# kubectl run --namespace default p5g-mongodb-client --rm --tty -i --restart='Never' --image docker.io/bitnami/mongodb:4.4.0-debian-10-r0 --command -- bash
# mongo admin --host "p5g-mongodb"
# kubectl port-forward --namespace default svc/p5g-mongodb 27017:27017 &
#    mongo --host 127.0.0.2
