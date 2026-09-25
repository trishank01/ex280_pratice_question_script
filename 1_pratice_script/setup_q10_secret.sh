#!/bin/bash
oc get project math &>/dev/null || oc new-project math &>/dev/null
oc delete secret magic -n math &>/dev/null
oc get deployment qed -n math &>/dev/null || oc create deployment qed --image=quay.io/redhattraining/hello-world-nginx:v1.0 -n math &>/dev/null
echo "🎯 Q10 Ready: Project 'math' and app 'qed' ready."
echo "👉 Task: Create secret 'magic' with Decoder_Ring: ASDA142hfh-gfrhhueo-erfdk345v in 'math'."
