#!/bin/bash
S=0
[ "$(oc auth can-i '*' '*' --as jobs 2>/dev/null)" = "yes" ] && S=$((S+35))
[ "$(oc auth can-i create projectrequests --as wozniak 2>/dev/null)" = "yes" ] && S=$((S+35))
[ "$(oc auth can-i create projectrequests --as armstrong 2>/dev/null)" = "no" ] && S=$((S+30))
echo "🎯 FINAL SCORE: $S / 100 Points ($S%)"
