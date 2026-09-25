#!/bin/bash
S=0
oc get template project-request -n openshift-config &>/dev/null && S=$((S+25))
[ "$(oc get projects.config.openshift.io/cluster -o jsonpath='{.spec.projectRequestTemplate.name}' 2>/dev/null)" = "project-request" ] && S=$((S+25))
oc delete project test-temp-q19 &>/dev/null
oc new-project test-temp-q19 &>/dev/null
sleep 2
oc get limitrange -n test-temp-q19 2>/dev/null | grep -q 'limit' && S=$((S+25))
oc get quota -n test-temp-q19 2>/dev/null | grep -q 'quota' && S=$((S+25))
oc delete project test-temp-q19 &>/dev/null
echo "FINAL SCORE: $S / 100 Points ($S%)"
