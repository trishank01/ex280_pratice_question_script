#!/bin/bash
S=0
oc get group commander -o jsonpath='{.users[*]}' 2>/dev/null | grep -qi wozniak && S=$((S+25))
oc get group pilot -o jsonpath='{.users[*]}' 2>/dev/null | grep -qi adlerin && S=$((S+25))
{ [ "$(oc auth can-i create deployments -n apache --as u --as-group commander 2>/dev/null)" = "yes" ] || oc get rolebindings -n apache -o yaml 2>/dev/null | grep -q 'name: commander'; } && S=$((S+25))
{ [ "$(oc auth can-i get pods -n apache --as u --as-group pilot 2>/dev/null)" = "yes" ] || oc get rolebindings -n apache -o yaml 2>/dev/null | grep -q 'name: pilot'; } && S=$((S+25))
echo "🎯 FINAL SCORE: $S / 100 Points ($S%)"
