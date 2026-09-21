cat << 'EOF' > setup_q04_groups.sh
#!/bin/bash
# Q4 Practice Environment Setup (Reset Groups for practice)
# Pre-requisites: apache & gemini projects must exist
oc get project apache &>/dev/null || oc new-project apache &>/dev/null
oc get project gemini &>/dev/null || oc new-project gemini &>/dev/null
# Clean old groups so user can solve Q4 from scratch
oc delete group commander pilot &>/dev/null
echo "🎯 Question 4 Practice Environment Ready!"
echo "Task: Create groups 'commander' & 'pilot', add users & assign roles."
EOF
chmod +x setup_q04.sh
./setup_q04.sh
