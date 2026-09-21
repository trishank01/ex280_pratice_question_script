cat << 'EOF' > verify_q16_install_operator.sh
#!/bin/bash
S=0
oc get project openshift-file-integrity &>/dev/null && S=$((S+25))
oc get subscription -n openshift-file-integrity 2>/dev/null | grep -qi 'file-integrity' && S=$((S+25))
oc get csv -n openshift-file-integrity 2>/dev/null | grep -qi 'Succeeded' && S=$((S+25))
oc get pods -n openshift-file-integrity -o jsonpath='{.items[*].status.phase}' 2>/dev/null | grep -qi 'Running' && S=$((S+25))
echo "FINAL SCORE: $S / 100 Points ($S%)"
EOF
chmod +x verify_q16_install_operator.sh && ./verify_q16_install_operator.sh
