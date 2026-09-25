#!/bin/bash
oc new-project space &>/dev/null || oc project space &>/dev/null
oc create deployment gamma --image=quay.io/redhattraining/hello-world-nginx:v1.0 -n space &>/dev/null
oc set probe deployment/gamma --remove --liveness -n space &>/dev/null
rm -rf /home/student/ex280-cluster* /home/student/ex280-*.tar.gz /home/student/.q20_uploaded
echo '#!/bin/bash' > /home/student/upload_diagnostics.sh
echo 'if [ -z "$1" ]; then echo "Usage: ./upload_diagnostics.sh <tarball>"; exit 1; fi' >> /home/student/upload_diagnostics.sh
echo 'if [ ! -f "$1" ]; then echo "Error: File not found"; exit 1; fi' >> /home/student/upload_diagnostics.sh
echo 'echo "SUCCESS: File uploaded to Red Hat support!"' >> /home/student/upload_diagnostics.sh
echo 'touch /home/student/.q20_uploaded' >> /home/student/upload_diagnostics.sh
chmod +x /home/student/upload_diagnostics.sh

echo "🎯 Q20 Setup Ready: App 'gamma' in project 'space' ready for health-check & diagnostics."
echo "📝 Note: A dummy script has been created at /home/student/upload_diagnostics.sh to simulate the exam upload step."
