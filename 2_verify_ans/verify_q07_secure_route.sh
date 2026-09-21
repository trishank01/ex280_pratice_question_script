cat << 'EOF' > verify_q07_secure_route.sh
#!/bin/bash
S=0
R=$(oc get route -n area51 -o json 2>/dev/null)
# 1. Route exists in area51
[ -n "$R" ] && echo "$R" | grep -q '"kind": *"Route"' && S=$((S+20))
# 2. Target service is oxcart
echo "$R" | grep -q '"name": *"oxcart"' && S=$((S+20))
# 3. Hostname matches oxcart.apps.*
echo "$R" | grep -q 'oxcart.apps' && S=$((S+20))
# 4. TLS Termination is edge
echo "$R" | grep -q '"termination": *"edge"' && S=$((S+20))
# 5. Certificate and Key are populated
echo "$R" | grep -q '"certificate":' && echo "$R" | grep -q '"key":' && S=$((S+20))
echo "🎯 FINAL SCORE: $S / 100 Points ($S%)"
EOF
chmod +x verify_q07.sh
./verify_q07.sh
