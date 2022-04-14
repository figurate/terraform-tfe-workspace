/*
 *
 * [![CI](https://github.com/figurate/terraform-tfe-workspace/actions/workflows/main.yml/badge.svg)](https://github.com/figurate/terraform-tfe-workspace/actions/workflows/main.yml)
 *
 */
resource "tfe_oauth_client" "vcs" {
  count            = var.repository != null ? 1 : 0
  api_url          = local.vcs[var.service_provider][0]
  http_url         = local.vcs[var.service_provider][1]
  oauth_token      = var.oauth_token
  organization     = var.organization
  service_provider = var.service_provider
}

resource "tfe_workspace" "workspace" {
  name              = var.name
  organization      = var.organization
  auto_apply        = var.auto_apply
  operations        = var.operations
  working_directory = var.working_directory

  dynamic "vcs_repo" {
    for_each = var.repository != null ? [1] : []
    content {
      identifier     = var.repository
      oauth_token_id = tfe_oauth_client.vcs[0].oauth_token_id
    }
  }
}

resource "tfe_variable" "workspace_vars" {
  for_each     = var.workspace_vars
  category     = "terraform"
  key          = each.key
  value        = each.value
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "workspace_vars_sensitive" {
  for_each     = var.workspace_vars_sensitive
  category     = "terraform"
  key          = each.key
  value        = each.value
  workspace_id = tfe_workspace.workspace.id
  sensitive    = true
}

resource "tfe_variable" "workspace_env" {
  for_each     = var.workspace_env
  category     = "env"
  key          = each.key
  value        = each.value
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "workspace_env_sensitive" {
  for_each     = var.workspace_env_sensitive
  category     = "env"
  key          = each.key
  value        = each.value
  workspace_id = tfe_workspace.workspace.id
  sensitive    = true
}

resource "tfe_run_trigger" "run_triggers" {
  count         = length(var.run_triggers)
  workspace_id  = tfe_workspace.workspace.id
  sourceable_id = var.run_triggers[count.index]
}
