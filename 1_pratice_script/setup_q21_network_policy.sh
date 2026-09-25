#!/bin/bash
echo ">>> Setting up environment for Q21 (Network Policy)..."

# Clean up first
oc delete project atlas bluewills &>/dev/null

# Create source project and pod
oc new-project bluewills &>/dev/null
oc create deployment rocky --image=quay.io/redhattraining/hello-world-nginx:v1.0 -n bluewills &>/dev/null

# Ensure namespace has the standard label for NetworkPolicy targeting
oc label namespace bluewills kubernetes.io/metadata.name=bluewills --overwrite &>/dev/null

echo ">>> Q21 Environment Ready!"
echo ">>> Tasks:"
echo " 1. Create project 'atlas' and deploy app 'mercury'"
echo " 2. Create Deny-All Ingress NetworkPolicy in 'atlas'"
echo " 3. Create NetworkPolicy in 'atlas' allowing traffic from pod 'rocky' in 'bluewills' to 'mercury' on TCP 8080"
