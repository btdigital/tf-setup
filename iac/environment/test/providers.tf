provider "google" {
  project = var.project_id
  region  = var.region
}

  default_tags {
    tags = {
      Environment = "test"
      ManagedBy   = "terraform"
      Repo        = "https://github.com/btdigital/tf-setup"
    }
  }
