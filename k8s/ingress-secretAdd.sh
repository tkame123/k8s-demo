#!/bin/bash

kubectl create secret tls --save-config tls-k8s-demo --key ./tls.key --cert ./tls.crt
