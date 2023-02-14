terraform {
  required_version = ">= 1.0"

  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.13.0"
    }
  }
}

resource "google_project_service" "iamcredentials" {
  project                    = var.project_id
  service                    = "iamcredentials.googleapis.com"
  disable_dependent_services = true
}

resource "google_bigquery_dataset" "bq_raw_staging" {
  dataset_id             = "bq_raw_staging"
  location               = var.location
  friendly_name          = "raw-staging"
  description            = "This dataset is used for storing data to dev."
  default_table_expiration_ms = 2592000000
  delete_contents_on_destroy = true
   labels = {
    env = "default"
  }
  access {
    role          = "OWNER"
    user_by_email = google_service_account.bqowner.email
  }
  access {
    role   = "READER"
    domain = "hashicorp.com"
  }
}

resource "google_bigquery_dataset" "bq_dev_dwh" {
  dataset_id             = "bq_dev_dwh"
  location               = var.location
  friendly_name          = "dev-dwh"
  description            = "This dataset is used for storing data to dev."
  default_table_expiration_ms = 2592000000
  delete_contents_on_destroy = true
   labels = {
    env = "default"
  }
  access {
    role          = "OWNER"
    user_by_email = google_service_account.bqowner.email
  }
  access {
    role   = "READER"
    domain = "hashicorp.com"
  }
}

resource "google_bigquery_dataset" "bq_test_dwh" {
  dataset_id             = "bq_test_dwh"
  location               = var.location
  friendly_name          = "test-dwh"
  description            = "This dataset is used for dq checks."
  default_table_expiration_ms = 2592000000
  delete_contents_on_destroy = true
   labels = {
    env = "default"
  }
  access {
    role          = "OWNER"
    user_by_email = "serviceAccount:${v}@${var.project_id}.iam.gserviceaccount.com"
  }
  access {
    role   = "READER"
    domain = "hashicorp.com"
  }
}

resource "google_service_account" "bqowner" {
  account_id = "bqowner"
}