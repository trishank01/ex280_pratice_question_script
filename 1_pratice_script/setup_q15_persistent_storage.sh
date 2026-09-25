#!/bin/bash
oc delete project space &>/dev/null
oc delete pv gamma-pv &>/dev/null
echo "🎯 Q15 Setup Ready: Old project 'space' and PV 'gamma-pv' cleared."
echo ""
echo "📝 EXAM QUESTION (COMBO: PV/PVC + Secure Route):"
echo "1. Create a PV named 'gamma-pv' (Access Mode: ReadWriteMany, Size: 1Gi)"
echo "   (Use NFS Server: 192.168.50.254 and Path: /exports-ocp4)"
echo "2. Create a PVC named 'gamma-pvc' in project 'space'"
echo "   (Size: 1Gi, Access Mode: ReadWriteMany)"
echo "3. Create project 'space' and deploy app 'gamma'"
echo "   (Image: quay.io/redhattraining/hello-world-nginx:v1.0)"
echo "4. Mount PVC to path: /srv"
echo "5. Scale replicas to 3"
echo "6. Make the application accessible at: https://space.apps.ocp4.example.com"
echo "   (Create Service and Secure Edge Route)"
