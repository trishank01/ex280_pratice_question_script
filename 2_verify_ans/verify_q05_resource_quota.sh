cat << 'EOF' > verify_q05_resource_quota.sh
#!/bin/bash
S=0
H=$(oc get quota ex280-quota -n apache -o json 2>/dev/null)
[ -n "$H" ] && S=$((S+20))
echo "$H" | grep -q -E '"memory": *"(1Gi|1G)"' && S=$((S+20))
echo "$H" | grep -q '"cpu": *"2"' && S=$((S+20))
echo "$H" | grep -q '"pods": *"3"' && S=$((S+20))
echo "$H" | grep -q '"services": *"6"' && echo "$H" | grep -q '"replicationcontrollers": *"3"' && S=$((S+20))
echo "🎯 FINAL SCORE: $S / 100 Points ($S%)"
EOF
chmod +x verify_q05.sh
./verify_q05.sh
