#!/bin/bash
S=0
oc get project apples &>/dev/null && S=$((S+20))
[ "$(oc get deploy oranges -n apples -o jsonpath='{.spec.template.spec.serviceAccountName}' 2>/dev/null)" == "ex280-sa" ] && S=$((S+30))
EP=$(oc get endpoints oranges -n apples -o jsonpath='{.subsets[*].addresses[*].ip}' 2>/dev/null)
[ -n "$EP" ] && S=$((S+25))
oc get route oranges -n apples &>/dev/null && S=$((S+25))
echo "🎯 FINAL SCORE: $S / 100 Points ($S%)"
