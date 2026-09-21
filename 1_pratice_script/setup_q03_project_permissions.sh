cat << 'EOF' > setup_q03_project_permissions.sh
#!/bin/bash
for p in apollo titan gemini bluebook apache; do oc delete project "$p" --wait=false &>/dev/null; done
echo ">>> Q3 Setup Ready (PDF: Configure Project Permissions)"
EOF
chmod +x setup_q03.sh
./setup_q03.sh
