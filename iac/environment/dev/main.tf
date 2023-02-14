terraform {
  required_version = ">= 1.0"

  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.13.0"
    }
  }
}


module "oidc" {
  source      = "../../modules/gh_oidc_module"
  project_id  = var.project_id
  pool_id     = var.pool_id
  provider_id = var.provider_id
  sa_mapping = {
    (google_service_account.sa.account_id) = {
      sa_name   = google_service_account.sa.name
      attribute = "attribute.repository/user/repo"
    }
  }
}

# Google Compute Engine: VM
# Ref: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance
module "vm_service" {
  source = "../../modules/google_compute_module"
}

# Cloud Composer Environment
# Ref: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/composer_environment
module "cloud-composer" {
  source     = "../../modules/cloud_composer_module"
  count      = local.cloud_composer_enabled
  project_id = local.project_id
  region     = var.region
  depends_on = [google_project_service.iamcredentials, google_project_service.cloud-composer]
}

# Google cloud storage bucket: Datalake
# https://registry.terraform.io/providers/hashicorp/random/latest/docs
resource "random_id" "bucket" {
  keepers = {
    # Generate a new id to uniquely identify the bucket
    bucket_id = "${var.project}"
  }

  byte_length = 8
}

module "gcs_bucket" {
  source                       = "../../modules/cloud_storage_module"
  for_each                     = var.gcs_buckets
  location                     = each.key
  project                      = var.project
  name                         = "${each.value.name}-${each.key}-${random_id.bucket.hex}"
  storage_class                = each.value.storage_class != "" ? each.value.storage_class : var.storage_class
  versioning_enabled           = each.value.versioning_enabled != "" ? each.value.versioning_enabled : var.versioning_enabled
  lifecycle_policy             = each.value.lifecycle_rule
  internal_tenant_roles_admin  = each.value.internal_tenant_roles_admin
  internal_tenant_roles_viewer = each.value.internal_tenant_roles_viewer
  external_tenant_roles_admin  = each.value.external_tenant_roles_admin
  external_tenant_roles_viewer = each.value.external_tenant_roles_viewer
}

# Data ware house : DWH
# Ref: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset
module "bq_dataset" {
  source = "../../modules/bq_warehouse_module"
}