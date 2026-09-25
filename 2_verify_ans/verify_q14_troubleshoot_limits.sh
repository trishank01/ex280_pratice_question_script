#!/bin/bash
S=0
oc get project path-finder &>/dev/null && S=$((S+20))
oc get deploy voyager -n path-finder &>/dev/null && S=$((S+30))
[ "$(oc get pods -n path-finder -o jsonpath='{.items[0].status.phase}' 2>/dev/null)" == "Running" ] && S=$((S+50))
echo "🎯 FINAL SCORE: $S / 100 Points ($S%)"
