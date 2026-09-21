cat << 'EOF' > verify_q10_secret.sh
#!/bin/bash
S=0
oc get project math &>/dev/null && S=$((S+20))
oc get secret magic -n math &>/dev/null && S=$((S+30))
[ "$(oc extract secret/magic -n math --to=- 2>/dev/null)" == "ASDA142hfh-gfrhhueo-erfdk345v" ] && S=$((S+50))
echo "🎯 FINAL SCORE: $S / 100 Points ($S%)"
EOF
chmod +x verify_q10_secret.sh && ./verify_q10_secret.sh

