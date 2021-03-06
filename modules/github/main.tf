module "workspace" {
  source = "../.."

  name                     = var.name
  organization             = var.organization
  auto_apply               = var.auto_apply
  service_provider         = "github"
  repository               = var.repository
  working_directory        = var.working_directory
  oauth_token              = var.oauth_token
  workspace_vars           = var.workspace_vars
  workspace_vars_sensitive = var.workspace_vars_sensitive
  workspace_env            = var.workspace_env
  workspace_env_sensitive  = var.workspace_env_sensitive
  run_triggers             = var.run_triggers
}
