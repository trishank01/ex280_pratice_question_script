cat << 'EOF' > setup_q20_monitoring_probes.sh
#!/bin/bash
oc new-project space &>/dev/null || oc project space &>/dev/null
oc create deployment gamma --image=quay.io/redhattraining/hello-world-nginx:v1.0 -n space &>/dev/null
oc set probe deployment/gamma --remove --liveness -n space &>/dev/null
rm -rf /home/student/ex280-cluster* /home/student/ex280-*.tar.gz
echo "🎯 Q20 Setup Ready: App 'gamma' in project 'space' ready for health-check & diagnostics."
EOF
chmod +x setup_q20_monitoring_probes.sh && ./setup_q20_monitoring_probes.sh
