#!/bin/bash
S=0
echo ">>> Verifying Q21 (Network Policy)..."

# 1. App mercury exists in atlas
[ "$(oc get deployment mercury -n atlas -o jsonpath='{.status.availableReplicas}' 2>/dev/null)" == "1" ] && S=$((S+25))

# 2. Deny all policy exists in atlas
oc get networkpolicy -n atlas -o yaml 2>/dev/null | grep -qi "podSelector: {}" && S=$((S+25))

# 3. Allow policy exists in atlas (checking for 'app: rocky' in allowed from section)
oc get networkpolicy -n atlas -o yaml 2>/dev/null | grep -qi "app: rocky" && S=$((S+25))

# 4. End-to-end check
ROCKY_POD=$(oc get pod -l app=rocky -n bluewills -o jsonpath='{.items[0].metadata.name}' 2>/dev/null)
MERCURY_IP=$(oc get pod -l app=mercury -n atlas -o jsonpath='{.items[0].status.podIP}' 2>/dev/null)

if [ -n "$ROCKY_POD" ] && [ -n "$MERCURY_IP" ]; then
    oc exec $ROCKY_POD -n bluewills -- curl -s --connect-timeout 2 http://$MERCURY_IP:8080 &>/dev/null && S=$((S+25))
fi

echo "FINAL SCORE: $S / 100 Points ($S%)"
