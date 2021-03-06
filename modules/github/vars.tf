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

variable "repository" {
  description = "A repository identifier to link to the workspace"
}

variable "working_directory" {
  description = "Execution directory relative to repository root"
  default     = null
}

variable "oauth_token" {
  description = "An OAuth token used to connect to a VCS provider"
}

variable "workspace_vars" {
  description = "A map of workspace variables"
  type        = map(string)
  default     = {}
}

variable "workspace_vars_sensitive" {
  description = "A map of sensitive workspace variables"
  type        = map(string)
  default     = {}
}

variable "workspace_env" {
  description = "A map of workspace environment variables"
  type        = map(string)
  default     = {}
}

variable "workspace_env_sensitive" {
  description = "A map of sensitive workspace environment variables"
  type        = map(string)
  default     = {}
}

variable "run_triggers" {
  description = "A list of workspace ids that trigger runs in this workspace when modified"
  type        = list(string)
  default     = []
}