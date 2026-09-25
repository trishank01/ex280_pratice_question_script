#!/bin/bash
oc get project path-finder &>/dev/null || oc new-project path-finder &>/dev/null
oc delete deployment voyager -n path-finder &>/dev/null
oc create deployment voyager --image=quay.io/redhattraining/hello-world-nginx:v1.0 -n path-finder &>/dev/null
oc set resources deployment/voyager --requests=memory=80Gi -n path-finder &>/dev/null
echo "🎯 Q14 Ready: Pod 'voyager' in 'path-finder' is Pending (due to 80Gi memory request)."
