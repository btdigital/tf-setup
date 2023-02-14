/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "project_id" {
  type        = string
  description = "The project id to create Workload Identity Pool"
  default     = "lambda-377114"
}

variable "gh_repo" {
  type        = string
  description = "The project repo to create Workload Identity Pool"
  default     = "https://github.com/btdigital/tf-setup"
}

variable "gh_branch" {
  type = string
  description = "The Branch on which the Workflow execution will be authorised in the format refs/heads/<BRANCH_NAME>"
}

variable "pool_id" {
  type        = string
  description = "Workload Identity Pool ID"
  default     = "lambda-pool-auth"
}

variable "pool_display_name" {
  type        = string
  description = "Workload Identity Pool display name"
  default     = "lambda-oidc-pool"
}

variable "pool_description" {
  type        = string
  description = "Workload Identity Pool description"
  default     = "Workload Identity Pool for github deployment"
}

variable "provider_id" {
  type        = string
  description = "Workload Identity Pool Provider id"
  default     = "gh-oidc-provider"
}

variable "issuer_uri" {
  type        = string
  description = "Workload Identity Pool Issuer URL"
  default     = "https://token.actions.githubusercontent.com"
}

variable "provider_display_name" {
  type        = string
  description = "Workload Identity Pool Provider display name"
  default     = "lambda-oidc"
}

variable "provider_description" {
  type        = string
  description = "Workload Identity Pool Provider description"
  default     = "Workload Identity Pool Provider managed by Terraform"
}

variable "attribute_condition" {
  type        = string
  description = "Workload Identity Pool Provider attribute condition expression. [More info](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider#attribute_condition)"
  default     = null
}

variable "attribute_mapping" {
  type        = map(any)
  description = "Workload Identity Pool Provider attribute mapping. [More info](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider#attribute_mapping)"
  default     = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository" = "assertion.repository"
  }
}

variable "allowed_audiences" {
  type        = string
  description = "Workload Identity Pool Provider allowed audiences."
  default     = ""
}

variable "sa_mapping" {
  type      = map(object({
  sa_name   = string
  attribute = string
  }))
  description = "Service Account resource names and corresponding WIF provider attributes. If attribute is set to `*` all identities in the pool are granted access to SAs."
  default     = {}
}