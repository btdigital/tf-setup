resource "google_bigquery_dataset" "bq_raw_staging" {
  dataset_id             = "bq_raw_staging"
  location               = var.location
  friendly_name          = "raw-staging"
  description            = "This dataset is used for storing data to dev."
  default_table_expiration_ms = 2592000000
  access {
      role = "OWNER"
      user_by_email = "serviceAccount:${v}@${var.project}.iam.gserviceaccount.com"
    }
  delete_contents_on_destroy = true
}
resource "google_bigquery_dataset" "bq_dev_dwh" {
  dataset_id             = "bq_dev_dwh"
  location               = var.location
  friendly_name          = "dev-dwh"
  description            = "This dataset is used for storing data to dev."
  default_table_expiration_ms = 2592000000
  access {
      role = "OWNER"
      user_by_email = "serviceAccount:${v}@${var.project}.iam.gserviceaccount.com"
    }
  delete_contents_on_destroy = true
}

resource "google_bigquery_dataset" "bq_test_dwh" {
  dataset_id             = "bq_test_dwh"
  location               = var.location
  friendly_name          = "test-dwh"
  description            = "This dataset is used for dq checks."
  default_table_expiration_ms = 2592000000
  access {
      role = "OWNER"
      user_by_email = "serviceAccount:${v}@${var.project}.iam.gserviceaccount.com"
    }
  delete_contents_on_destroy = true
}
