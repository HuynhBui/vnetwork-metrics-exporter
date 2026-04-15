#!/bin/bash

VMONITOR_SITE=${VMONITOR_SITE} \
IAM_CLIENT_ID=${IAM_CLIENT_ID} \
IAM_CLIENT_SECRET=${IAM_CLIENT_SECRET} \
IAM_URL=${IAM_URL} \
bash -c "$(curl -L https://raw.githubusercontent.com/vngcloud/vmonitor-metrics-agent/main/install.sh)"
