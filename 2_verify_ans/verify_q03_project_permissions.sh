cat << 'EOF' > verify_q03_project_permissions.sh
#!/bin/bash
S=0
PROJS_OK=1
for p in apollo titan gemini bluebook apache; do
  oc get project "$p" &>/dev/null || PROJS_OK=0
done
[ $PROJS_OK -eq 1 ] && S=$((S+40))
[ "$(oc auth can-i create rolebindings -n apollo --as armstrong 2>/dev/null)" = "yes" ] && S=$((S+20))
[ "$(oc auth can-i create rolebindings -n titan --as armstrong 2>/dev/null)" = "yes" ] && S=$((S+20))
[ "$(oc auth can-i get pods -n apollo --as collins 2>/dev/null)" = "yes" ] && S=$((S+20))
echo "🎯 FINAL SCORE: $S / 100 Points ($S%)"
EOF
chmod +x verify_q03.sh
./verify_q03.sh
