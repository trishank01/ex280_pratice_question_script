#!/bin/bash
helm uninstall example-app -n charts-development &>/dev/null
helm repo remove ex280-repo &>/dev/null
oc delete project charts-development &>/dev/null
echo "🎯 Q18 Setup Ready: Project 'charts-development' cleared for practice."
