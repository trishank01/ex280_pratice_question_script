#!/bin/bash
oc get project gru &>/dev/null || oc new-project gru &>/dev/null
oc delete all --all -n gru &>/dev/null
oc delete hpa --all -n gru &>/dev/null
sleep 2
oc create deployment scala --image=quay.io/redhattraining/hello-world-nginx:v1.0 -n gru &>/dev/null
echo "🎯 Q9 Ready: App 'scala' in 'gru'. Target: min 6, max 40, cpu 60%, req 25m, lim 100m"
