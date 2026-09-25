#!/bin/bash
oc delete template project-request -n openshift-config &>/dev/null
oc patch projects.config.openshift.io/cluster --type=merge -p '{"spec":{"projectRequestTemplate":{"name":""}}}' &>/dev/null
oc delete project test-template-demo test-temp-q19 &>/dev/null
echo "🎯 Q19 Setup Ready: Custom project template cleared for practice."
