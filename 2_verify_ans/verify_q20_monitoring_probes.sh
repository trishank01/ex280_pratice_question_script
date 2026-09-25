#!/bin/bash
S=0
oc get deployment gamma -n space -o yaml 2>/dev/null | grep -A 8 'livenessProbe' | grep -qi 'tcpSocket' && S=$((S+20))
oc get deployment gamma -n space -o yaml 2>/dev/null | grep -A 8 'livenessProbe' | grep -qi 'initialDelaySeconds: 3' && S=$((S+20))
find /home/student -maxdepth 1 -type d -name "ex280-*" | grep -q "ex280-" && S=$((S+20))
ls /home/student/ex280-*.tar.gz &>/dev/null && S=$((S+20))
[ -f "/home/student/.q20_uploaded" ] && S=$((S+20))
echo "FINAL SCORE: $S / 100 Points ($S%)"
