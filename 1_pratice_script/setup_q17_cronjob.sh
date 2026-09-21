cat << 'EOF' > setup_q17_cronjob.sh
#!/bin/bash
oc delete project marathon &>/dev/null
echo "🎯 Q17 Setup Ready: Project 'marathon' cleared for practice."
EOF
chmod +x setup_q17_cronjob.sh && ./setup_q17_cronjob.sh
