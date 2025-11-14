#!/bin/bash

# Collect local commit information
COMMIT_ID=$(git rev-parse --short HEAD)
GITHUB_USER=$(git log -1 --pretty=format:'%an')
LOCAL_USER=$(whoami)   # The person running the script
DATE_TIME=$(date '+%Y-%m-%d %H:%M')

# Create log directory locally if it does not exist
mkdir -p ./deployment_logs

# Append log entry to local log file
echo "$DATE_TIME | Deployed-by: $LOCAL_USER | Commit: $COMMIT_ID | GitHub-User: $GITHUB_USER" >> ./deployment_logs/deployment.log

# (Optional) Simulate "deployment" by copying frontend to a local folder
mkdir -p ./local_server/frontend
cp -r ./* ./local_server/frontend

echo "✅ Deployment simulated and logged successfully!"
echo "📄 Log file: ./deployment_logs/deployment.log"
