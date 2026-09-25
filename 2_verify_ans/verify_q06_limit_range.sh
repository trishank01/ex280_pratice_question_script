#!/bin/bash
S=0
L=$(oc get limitrange ex280-limits -n bluebook -o json 2>/dev/null)
[ -n "$L" ] && S=$((S+20))
echo "$L" | grep -q '"type": *"Pod"' && echo "$L" | grep -q '300Mi' && S=$((S+20))
echo "$L" | grep -q '"type": *"Pod"' && echo "$L" | grep -q '500m' && S=$((S+20))
echo "$L" | grep -q '"type": *"Container"' && echo "$L" | grep -q '10m' && S=$((S+20))
echo "$L" | grep -q '"defaultRequest"' && echo "$L" | grep -q '100m' && echo "$L" | grep -q '100Mi' && S=$((S+20))
echo "🎯 FINAL SCORE: $S / 100 Points ($S%)"
