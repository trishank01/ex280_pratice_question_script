#!/bin/bash
S=0
echo ">>> Verifying Q15 (PV, PVC, Replicas & Secure Route)..."

# 1. PV and PVC are Bound (20 pts)
PV_STATUS=$(oc get pv gamma-pv -o jsonpath='{.status.phase}' 2>/dev/null)
PVC_STATUS=$(oc get pvc gamma-pvc -n space -o jsonpath='{.status.phase}' 2>/dev/null)
if [ "$PV_STATUS" == "Bound" ] && [ "$PVC_STATUS" == "Bound" ]; then
    S=$((S+20))
fi

# 2. Deployment exists with 3 replicas (20 pts)
REPLICAS=$(oc get deployment gamma -n space -o jsonpath='{.spec.replicas}' 2>/dev/null)
if [ "$REPLICAS" == "3" ]; then
    S=$((S+20))
fi

# 3. Mount Path is correct (20 pts)
oc get deployment gamma -n space -o yaml 2>/dev/null | grep -q 'mountPath: /srv' && S=$((S+20))

# 4. Route has correct hostname and Edge TLS (20 pts)
HOST=$(oc get route -n space -o jsonpath='{.items[0].spec.host}' 2>/dev/null)
TLS=$(oc get route -n space -o jsonpath='{.items[0].spec.tls.termination}' 2>/dev/null)
if [[ "$HOST" == "space.apps."* ]] && [ "$TLS" == "edge" ]; then
    S=$((S+20))
fi

# 5. Service Endpoints exist (20 pts)
SVC_NAME=$(oc get route -n space -o jsonpath='{.items[0].spec.to.name}' 2>/dev/null)
if [ -n "$SVC_NAME" ]; then
    EP_COUNT=$(oc get endpoints $SVC_NAME -n space -o jsonpath='{.subsets[0].addresses}' 2>/dev/null)
    if [ "$EP_COUNT" != "" ]; then
        S=$((S+20))
    fi
fi

echo "FINAL SCORE: $S / 100 Points ($S%)"
