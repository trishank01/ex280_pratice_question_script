cat << 'EOF' > setup_q16_install_operator.sh
#!/bin/bash
oc delete subscription file-integrity-operator -n openshift-file-integrity &>/dev/null
oc delete project openshift-file-integrity &>/dev/null
echo "🎯 Q16 Setup Ready: Operator subscription & project cleared for practice."
EOF
chmod +x setup_q16_install_operator.sh && ./setup_q16_install_operator.sh
