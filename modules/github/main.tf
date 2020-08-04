module "workspace" {
  source = "../.."

  name             = var.name
  organization     = var.organization
  auto_apply       = var.auto_apply
  operations       = var.operations
  service_provider = "github"
  repository       = var.repository
  oauth_token      = var.oauth_token
}
