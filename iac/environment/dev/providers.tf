provider "google" {
  project = local.project_id
  region  = var.region
  credentials = var.gcp_credentials
}

