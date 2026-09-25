#!/bin/bash
S=0
oc get project apples &>/dev/null && S=$((S+20))
oc get sa ex280-sa -n apples &>/dev/null && S=$((S+40))
if oc get scc anyuid -o yaml 2>/dev/null | grep -q 'apples:ex280-sa' || [ "$(oc auth can-i use scc/anyuid --as=system:serviceaccount:apples:ex280-sa -n apples 2>/dev/null)" == "yes" ]; then
  S=$((S+40))
fi
echo "🎯 FINAL SCORE: $S / 100 Points ($S%)"
