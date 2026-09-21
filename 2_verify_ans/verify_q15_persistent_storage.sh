cat << 'EOF' > verify_q15_persistent_storage.sh
#!/bin/bash
S=0
[ "$(oc get pv gamma-pv -o jsonpath='{.status.phase}' 2>/dev/null)" = "Bound" ] && S=$((S+25))
[ "$(oc get pvc gamma-pvc -n space -o jsonpath='{.status.phase}' 2>/dev/null)" = "Bound" ] && S=$((S+25))
oc get deployment gamma -n space -o yaml 2>/dev/null | grep -q 'mountPath: /srv' && S=$((S+25))
oc get route -n space 2>/dev/null | grep -qiE 'space|gamma' && S=$((S+25))
echo "FINAL SCORE: $S / 100 Points ($S%)"
EOF
chmod +x verify_q15_persistent_storage.sh && ./verify_q15_persistent_storage.sh
