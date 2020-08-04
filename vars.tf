variable "name" {
  description = "Name of the workspace"
}

variable "organization" {
  description = "Organization of the workspace"
}

variable "auto_apply" {
  description = "Indicates whether to automatically apply successful changes"
  type        = bool
  default     = false
}

variable "operations" {
  description = "Enable remote operations (disable for local runs)"
  default     = true
}

variable "repository" {
  description = "A repository identifier to link to the workspace"
  default     = null
}

variable "service_provider" {
  description = "VCS provider identifier"
  default     = null
}

variable "oauth_token" {
  description = "An OAuth token used to connect to a VCS provider"
  default     = null
}
