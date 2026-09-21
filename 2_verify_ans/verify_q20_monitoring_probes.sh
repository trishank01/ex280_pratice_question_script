cat << 'EOF' > verify_q20_monitoring_probes.sh
#!/bin/bash
S=0
oc get deployment gamma -n space -o yaml 2>/dev/null | grep -A 8 'livenessProbe' | grep -qi 'tcpSocket' && S=$((S+25))
oc get deployment gamma -n space -o yaml 2>/dev/null | grep -A 8 'livenessProbe' | grep -qi 'initialDelaySeconds: 3' && S=$((S+25))
[ -d "/home/student/ex280-cluster-data" ] && S=$((S+25))
ls /home/student/ex280-*.tar.gz &>/dev/null && S=$((S+25))
echo "FINAL SCORE: $S / 100 Points ($S%)"
EOF
chmod +x verify_q20_monitoring_probes.sh && ./verify_q20_monitoring_probes.sh
