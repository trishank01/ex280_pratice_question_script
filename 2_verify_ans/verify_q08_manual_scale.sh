cat << 'EOF' > verify_q08_manual_scale.sh
#!/bin/bash
S=0
oc get project lerna &>/dev/null && S=$((S+20))
oc get deployment hydra -n lerna &>/dev/null && S=$((S+20))
[ "$(oc get deployment hydra -n lerna -o jsonpath='{.spec.replicas}' 2>/dev/null)" = "5" ] && S=$((S+30))
[ "$(oc get deployment hydra -n lerna -o jsonpath='{.status.readyReplicas}' 2>/dev/null)" = "5" ] && S=$((S+30))
echo "🎯 FINAL SCORE: $S / 100 Points ($S%)"
EOF
chmod +x verify_q08_manual.sh
./verify_q08_manual.sh
