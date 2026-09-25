#!/bin/bash
oc get project math &>/dev/null || oc new-project math &>/dev/null
oc get secret magic -n math &>/dev/null || oc create secret generic magic --from-literal=Decoder_Ring=ASDA142hfh-gfrhhueo-erfdk345v -n math &>/dev/null
oc delete deployment qed -n math &>/dev/null
oc create deployment qed --image=quay.io/redhattraining/hello-world-nginx:v1.0 -n math &>/dev/null
echo "🎯 Q11 Ready! Deployment 'qed' and secret 'magic' ready in 'math'."
