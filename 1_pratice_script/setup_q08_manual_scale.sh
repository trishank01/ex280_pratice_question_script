cat << 'EOF' > setup_q08_manual_scale.sh
#!/bin/bash
# Question 8 Setup: Project lerna with application hydra
oc get project lerna &>/dev/null || oc new-project lerna &>/dev/null
oc delete deployment hydra -n lerna &>/dev/null
oc create deployment hydra --image=quay.io/redhattraining/hello-world-nginx:v1.0 -n lerna &>/dev/null
oc scale deployment/hydra --replicas=1 -n lerna &>/dev/null
echo "🎯 Question 8 Ready! App 'hydra' created in project 'lerna' with 1 replica."
echo "👉 Target: Scale 'hydra' deployment to 5 replicas."
EOF
chmod +x setup_q08_manual.sh
./setup_q08_manual.sh
