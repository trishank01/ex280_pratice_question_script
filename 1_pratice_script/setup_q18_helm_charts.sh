cat << 'EOF' > setup_q18_helm_charts.sh
#!/bin/bash
helm uninstall example-app -n charts-development &>/dev/null
helm repo remove ex280-repo &>/dev/null
oc delete project charts-development &>/dev/null
echo "🎯 Q18 Setup Ready: Project 'charts-development' cleared for practice."
EOF
chmod +x setup_q18_helm_charts.sh && ./setup_q18_helm_charts.sh
