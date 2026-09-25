#!/bin/bash
S=0
oc get project charts-development &>/dev/null && S=$((S+25))
helm list -n charts-development 2>/dev/null | grep -qiE 'example-app|etherpad' && S=$((S+25))
oc get pods -n charts-development -o jsonpath='{.items[*].status.phase}' 2>/dev/null | grep -qi 'Running' && S=$((S+25))
oc get route -n charts-development 2>/dev/null | grep -qi 'etherpad' && S=$((S+25))
echo "FINAL SCORE: $S / 100 Points ($S%)"
