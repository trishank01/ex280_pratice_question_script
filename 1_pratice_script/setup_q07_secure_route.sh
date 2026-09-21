cat << 'EOF' > setup_q07_secure_route.sh
#!/bin/bash
# Question 7 Setup: Project area51 with application oxcart
oc get project area51 &>/dev/null || oc new-project area51 &>/dev/null
oc create deployment oxcart --image=quay.io/redhattraining/hello-world-nginx:v1.0 -n area51 &>/dev/null
oc expose deployment oxcart --port=8080 -n area51 &>/dev/null
oc delete route oxcart -n area51 &>/dev/null
echo "🎯 Question 7 Ready! App 'oxcart' ready in 'area51'. Target: Create secure edge route."
EOF
chmod +x setup_q07.sh
./setup_q07.sh
