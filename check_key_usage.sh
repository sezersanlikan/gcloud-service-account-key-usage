#!/bin/bash

# Service account details (replace with your values)
SERVICE_ACCOUNT_EMAIL="example@project.iam.gserviceaccount.com"
PROJECT_ID="your-project-id"
LIMIT=10

# Array of Key IDs (replace with your key IDs)
KEY_IDS=(
  "example-key-id-1"
  "example-key-id-2"
  "example-key-id-3"
  "example-key-id-4"
  "example-key-id-5"
  "example-key-id-6"
  "example-key-id-7"
  "example-key-id-8"
  "example-key-id-9"
  "example-key-id-10"
)

# Results array
RESULTS=()

# Loop over each key ID
for KEY_ID in "${KEY_IDS[@]}"; do
  echo "Checking usage for Key ID: $KEY_ID"
  
  # Run gcloud policy-intelligence query-activity command
  RESULT=$(gcloud policy-intelligence query-activity --activity-type=serviceAccountKeyLastAuthentication --query-filter="activities.full_resource_name=\"//iam.googleapis.com/projects/$PROJECT_ID/serviceAccounts/$SERVICE_ACCOUNT_EMAIL/keys/$KEY_ID\"" --project=$PROJECT_ID --limit=$LIMIT --format="yaml")

  # Extract last authentication time
  LAST_AUTHENTICATED_TIME=$(echo "$RESULT" | grep 'lastAuthenticatedTime' | awk '{print $2}' | sed "s/'//g")

  # Prepare result for this key ID
  if [[ -z "$LAST_AUTHENTICATED_TIME" ]]; then
    RESULTS+=("Key ID $KEY_ID has not been used.")
  else
    RESULTS+=("Key ID $KEY_ID last used on: $LAST_AUTHENTICATED_TIME")
  fi
done

# Output all results at once
echo "-------------------------------"
echo "Summary of Key Usage:"
for RESULT in "${RESULTS[@]}"; do
  echo "$RESULT"
done
