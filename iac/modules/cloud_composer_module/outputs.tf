output "composer_enabled" {
  description = "Map of bigquery view resources being provisioned."
  value       = google_project_service.cloud-composer
}

output "composer_iamcredentials" {
  description = "Map of bigquery view resources being provisioned."
  value       = google_project_service.iamcredentials
}
