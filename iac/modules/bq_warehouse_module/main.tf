resource "google_bigquery_dataset" "datasets" {
  for_each = local.datasets

  project                     = var.project_id
  dataset_id                  = each.value["dataset_id"]
  friendly_name               = each.value["friendly_name"]
  description                 = each.value["description"]
  location                    = each.value["location"]

  access {
    role = each.value["role"]
    user_by_email = each.value["service_account"]
  }
}