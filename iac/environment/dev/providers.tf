provider "google" {
  project = var.project_id
  region  = var.region
}

default_tags {
    tags = {
    Environment = "dev"
    ManagedBy   = "terraform"
    Repo        = "https://github.com/btdigital/tf-setup"
    }
  }
