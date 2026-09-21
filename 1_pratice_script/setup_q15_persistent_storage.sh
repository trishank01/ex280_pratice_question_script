cat << 'EOF' > setup_q15_persistent_storage.sh
#!/bin/bash
oc delete project space &>/dev/null
oc delete pv gamma-pv &>/dev/null
echo "🎯 Q15 Setup Ready: Project 'space' and PV 'gamma-pv' cleared for practice."
EOF
chmod +x setup_q15_persistent_storage.sh && ./setup_q15_persistent_storage.sh
