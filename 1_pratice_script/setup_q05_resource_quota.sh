#!/bin/bash
# Question 5 Setup: Reset Quotas for practice
oc get project apache &>/dev/null || oc new-project apache &>/dev/null
oc delete quota ex280-quota -n apache &>/dev/null
echo "🎯 Question 5 Ready! Target: Create 'ex280-quota' in project 'apache'."
