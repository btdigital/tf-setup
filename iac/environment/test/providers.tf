provider "google" {
  project = var.project_id
  region  = var.region
}

label {
    tags = {
    Environment = "test"
    ManagedBy   = "terraform"
    Repo        = "https://github.com/btdigital/tf-setup"
    }
  }
