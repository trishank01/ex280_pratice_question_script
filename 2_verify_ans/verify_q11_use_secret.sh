#!/bin/bash
S=0
oc get project math &>/dev/null && S=$((S+20))
D=$(oc get deploy qed -n math -o json 2>/dev/null)
[ -n "$D" ] && S=$((S+20))
echo "$D" | grep -qi '"name": *"magic"' && S=$((S+30))
echo "$D" | grep -qi '"prefix": *"DECODE_"' && S=$((S+30))
echo "🎯 FINAL SCORE: $S / 100 Points ($S%)"
