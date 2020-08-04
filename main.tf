resource "tfe_oauth_client" "vcs" {
  count            = var.repository != null ? 1 : 0
  api_url          = local.vcs[var.service_provider][0]
  http_url         = local.vcs[var.service_provider][1]
  oauth_token      = var.oauth_token
  organization     = var.organization
  service_provider = var.service_provider
}

resource "tfe_workspace" "workspace" {
  name         = var.name
  organization = var.organization
  auto_apply   = var.auto_apply
  operations   = var.operations

  dynamic "vcs_repo" {
    for_each = var.repository != null ? [1] : []
    content {
      identifier     = var.repository
      oauth_token_id = tfe_oauth_client.vcs[0].oauth_token_id
    }
  }
}
