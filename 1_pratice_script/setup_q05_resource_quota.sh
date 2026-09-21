cat << 'EOF' > setup_q05_resource_quota.sh
#!/bin/bash
# Question 5 Setup: Reset Quotas for practice
oc get project apache &>/dev/null || oc new-project apache &>/dev/null
oc delete quota ex280-quota -n apache &>/dev/null
echo "🎯 Question 5 Ready! Target: Create 'ex280-quota' in project 'apache'."
EOF
chmod +x setup_q05.sh
./setup_q05.sh
