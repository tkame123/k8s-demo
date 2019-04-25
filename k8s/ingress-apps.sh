#!/bin/bash

kubectl exec -it k8s-demo-ingress-apps-1 -- mkdir /usr/share/nginx/html/path1/
kubectl exec -it k8s-demo-ingress-apps-1 -- cp /etc/hostname /usr/share/nginx/html/path1/index.html

kubectl exec -it k8s-demo-ingress-apps-2 -- mkdir /usr/share/nginx/html/path2/
kubectl exec -it k8s-demo-ingress-apps-2 -- cp /etc/hostname /usr/share/nginx/html/path2/index.html

kubectl exec -it k8s-demo-ingress-apps-default -- cp /etc/hostname /usr/share/nginx/html/index.html

