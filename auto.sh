#!/bin/bash

cd /home/alihamza/Documents/shellprac/script/auto-script

git add .

git commit -m "automated update $(date) "

git push origin main

# This will be triggered by GitHub via POST request
SLACK_WEBHOOK_URL="https://hooks.slack.com/services/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"

MESSAGE="🚀 Code pushed to GitHub at $(date)"

response=$(curl -X POST -H 'Content-type: application/json' \
--data "{\"text\":\"$MESSAGE\"}" \
"$SLACK_WEBHOOK_URL")

if [[ "$response" != "ok" ]]; then
curl -S -X POST -H 'Content-type: application/json' \
--data "{\"text\":\"❌ Slack message failed to send. Response: $response\"}" \
"$SLACK_WEBHOOK_URL"
else
	echo "notification sent successfully"
fi


