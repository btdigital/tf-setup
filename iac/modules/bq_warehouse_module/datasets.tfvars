{
    "datasets": {
      "bq_raw_staging": {
        "dataset_id": "bq_raw_staging",
        "location" : "europe-west6",
        "friendly_name" : "raw-staging",
        "description" : "This dataset is used for storing data to dev.",
        "role": "roles/bigquery.admin",
        "service_account":  "serviceAccount:${v}@${var.project}.iam.gserviceaccount.com",
        "delete_contents_on_destroy": true
    },
      "bq_dev_dwh": {
          "dataset_id": "bq_dev_dwh",
          "location" : "europe-west6",
          "friendly_name" : "dev-dwh",
          "description" : "This dataset is used for storing data to dev.",
          "role": "roles/bigquery.admin",
          "service_account":  "serviceAccount:${v}@${var.project}.iam.gserviceaccount.com",
          "delete_contents_on_destroy": true
        },
      "bq_test_dwh": {
          "dataset_id": "bq_test_dwh",
          "location" : "europe-west6",
          "friendly_name" : "test-dwh",
          "description" : "This dataset is used for dq checks.",
          "role": "roles/bigquery.admin",
          "service_account":  "serviceAccount:${v}@${var.project}.iam.gserviceaccount.com",
          "delete_contents_on_destroy": true
      }
}
}
