# Service Account Key Usage Checker

This repository contains a Bash script to check the last usage time of service account keys in Google Cloud Platform (GCP). The script queries the Google Cloud Policy Intelligence API to retrieve and summarize the last authentication times for a list of service account keys.

## Script Overview

The `check_key_usage.sh` script performs the following tasks:
1. Queries the Google Cloud Policy Intelligence API for the last authentication time of each service account key.
2. Outputs the last used date for each key or indicates if a key has not been used.

## Prerequisites

- Google Cloud SDK (`gcloud`) must be installed and configured on your machine.
- The script requires permission to access the Policy Intelligence API and view service account key activities.

## Configuration

1. **Update Service Account Email and Project ID**

   Replace `example@project.iam.gserviceaccount.com` with your service account email and `your-project-id` with your GCP project ID.

   ```bash
   SERVICE_ACCOUNT_EMAIL="example@project.iam.gserviceaccount.com"
   PROJECT_ID="your-project-id"
Update Key IDs

