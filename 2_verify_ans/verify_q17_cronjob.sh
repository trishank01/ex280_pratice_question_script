cat << 'EOF' > verify_q17_cronjob.sh
#!/bin/bash
S=0
oc get cronjob scaling -n marathon &>/dev/null && S=$((S+25))
oc get cronjob scaling -n marathon -o jsonpath='{.spec.schedule}' 2>/dev/null | grep -qE '0?5 0?4 0?2' && S=$((S+25))
[ "$(oc get cronjob scaling -n marathon -o jsonpath='{.spec.jobTemplate.spec.template.spec.serviceAccountName}' 2>/dev/null)" = "ex280-ocpsa" ] && S=$((S+25))
[ "$(oc get cronjob scaling -n marathon -o jsonpath='{.spec.successfulJobsHistoryLimit}' 2>/dev/null)" = "13" -o "$(oc get cronjob scaling -n marathon -o jsonpath='{.spec.successfulJobHistoryLimit}' 2>/dev/null)" = "13" ] && S=$((S+25))
echo "FINAL SCORE: $S / 100 Points ($S%)"
EOF
chmod +x verify_q17_cronjob.sh && ./verify_q17_cronjob.sh
