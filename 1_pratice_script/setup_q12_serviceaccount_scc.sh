#!/bin/bash
oc get project apples &>/dev/null || oc new-project apples &>/dev/null
oc delete sa ex280-sa -n apples &>/dev/null
oc adm policy remove-scc-from-user anyuid -z ex280-sa -n apples &>/dev/null
echo "🎯 Q12 Ready: Project 'apples' ready. Target: Create SA 'ex280-sa' with 'anyuid' SCC."
