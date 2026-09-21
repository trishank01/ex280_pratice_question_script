cat << 'EOF' > setup_q06_limit_range.sh
#!/bin/bash
# Question 6 Setup: LimitRange in project bluebook
oc get project bluebook &>/dev/null || oc new-project bluebook &>/dev/null
oc delete limitrange ex280-limits -n bluebook &>/dev/null
echo "🎯 Question 6 Ready! Target: Create 'ex280-limits' in project 'bluebook'."
EOF
chmod +x setup_q06.sh
./setup_q06.sh
