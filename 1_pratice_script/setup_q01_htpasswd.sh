#!/bin/bash
oc delete secret htpass-idp-ex280 ex280-idp-secret -n openshift-config &>/dev/null
oc delete user jobs wozniak collins adlerin armstrong Thomson Robert Joseph job Armstrong richard &>/dev/null
oc delete identity $(oc get identity -o jsonpath='{.items[*].metadata.name}' 2>/dev/null | tr ' ' '\n' | grep -E 'htpass|ex280') &>/dev/null
python3 -c "import json, subprocess
try:
    raw = subprocess.check_output(['oc','get','oauth','cluster','-o','json'])
    doc = json.loads(raw)
    idps = doc.get('spec', {}).get('identityProviders', [])
    doc['spec']['identityProviders'] = [i for i in idps if i.get('type') != 'HTPasswd']
    subprocess.run(['oc','apply','-f','-'], input=json.dumps(doc), text=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
except Exception:
    pass" &>/dev/null
rm -f ~/htpassfile
echo ">>> Q1 Environment Reset: Clean OAuth (No HTPasswd, Only LDAP) - Exact Exam State!"
