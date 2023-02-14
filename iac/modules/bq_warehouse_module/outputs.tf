output "bq_res" {
  description = "ID of the VPC"
  value       = google_service_account.bqowner 
}