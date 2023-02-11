provider "google" {
  project = var.project_id
  region  = var.region
}

label {
    tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
    Repo        = "https://github.com/btdigital/tf-setup"
    }
  }
