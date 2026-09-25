#!/bin/bash
for p in apollo titan gemini bluebook apache; do oc delete project "$p" --wait=false &>/dev/null; done
echo ">>> Q3 Setup Ready (PDF: Configure Project Permissions)"
