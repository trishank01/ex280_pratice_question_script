cat << 'EOF' > setup_q13_troubleshoot_endpoints.sh
#!/bin/bash
oc get project apples &>/dev/null || oc new-project apples &>/dev/null
oc delete deploy oranges svc oranges route oranges -n apples &>/dev/null
oc create deployment oranges --image=quay.io/redhattraining/hello-world-nginx:v1.0 -n apples &>/dev/null
oc create service clusterip oranges --tcp=8080:8080 -n apples &>/dev/null
oc patch svc oranges -n apples -p '{"spec":{"selector":{"app":"orange"}}}' &>/dev/null
oc expose svc oranges -n apples &>/dev/null
echo "🎯 Q13 Ready! App 'oranges' in 'apples' with pre-created Route. Broken selector & missing SA configured."
EOF
chmod +x setup_q13_troubleshoot_endpoints.sh && ./setup_q13_troubleshoot_endpoints.sh
