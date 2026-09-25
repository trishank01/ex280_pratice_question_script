#!/bin/bash
S=0
oc get secret htpass-idp-ex280 -n openshift-config &>/dev/null && S=$((S+20))
oc get oauth cluster -o json 2>/dev/null | grep -q 'htpass-ex280' && S=$((S+20))
for u in jobs:jobs123 wozniak:wozniak123 collins:collins123 adlerin:adlerin123 armstrong:armstrong123; do
  oc login -u ${u%%:*} -p ${u##*:} https://api.ocp4.example.com:6443 &>/dev/null && S=$((S+12))
done
oc login -u admin -p redhatocp https://api.ocp4.example.com:6443 &>/dev/null
echo "🎯 FINAL SCORE: $S / 100 Points ($S%)"
