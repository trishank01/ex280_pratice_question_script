cat << 'EOF' > setup_q02_cluster_permissions.sh
#!/bin/bash
oc adm policy add-cluster-role-to-group self-provisioner system:authenticated:oauth &>/dev/null
oc adm policy remove-cluster-role-from-user self-provisioner wozniak &>/dev/null
oc adm policy remove-cluster-role-from-user cluster-admin jobs &>/dev/null
echo ">>> Q2 Reset Ready (Exact PDF State)!"
EOF
chmod +x setup_q02.sh
./setup_q02.sh
