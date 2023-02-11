provider "google" {
  project = var.project_id
  region  = var.region
}

label {
    tags = {
    Environment = "dev"
    ManagedBy   = "terraform"
    Repo        = "https://github.com/btdigital/tf-setup"
    }
  }
