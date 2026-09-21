cat << 'EOF' > verify_q09_hpa.sh
#!/bin/bash
S=0
oc get project gru &>/dev/null && S=$((S+20))
[ "$(oc get deploy scala -n gru -o jsonpath='{.spec.template.spec.containers[0].resources.requests.cpu}' 2>/dev/null)" == "25m" ] && S=$((S+20))
[ "$(oc get deploy scala -n gru -o jsonpath='{.spec.template.spec.containers[0].resources.limits.cpu}' 2>/dev/null)" == "100m" ] && S=$((S+20))
[ "$(oc get hpa scala -n gru -o jsonpath='{.spec.minReplicas}' 2>/dev/null)" == "6" ] && S=$((S+20))
[ "$(oc get hpa scala -n gru -o jsonpath='{.spec.maxReplicas}' 2>/dev/null)" == "40" ] && S=$((S+20))
echo "🎯 FINAL SCORE: $S / 100 Points ($S%)"
EOF
chmod +x verify_q09_hpa.sh && ./verify_q09_hpa.sh

