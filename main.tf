data "github_repositories" "mine" {
  query = "user:oke-py archived:false -topic:article -topic:presentation"
}

resource "github_repository" "codes" {
  for_each = toset(data.github_repositories.mine.names)

  name = each.key

  description  = local.repos[each.key].description
  homepage_url = local.repos[each.key].homepage_url
  topics       = local.repos[each.key].topics

  visibility   = "public"
  has_issues   = true
  has_projects = false
  has_wiki     = false

  allow_squash_merge     = false
  allow_rebase_merge     = false
  delete_branch_on_merge = true

  vulnerability_alerts = true
}

resource "github_repository_file" "editorconfig" {
  for_each = toset(data.github_repositories.mine.names)

  repository          = each.key
  branch              = "main"
  file                = ".editorconfig"
  content             = file(".editorconfig")
  commit_message      = "distribute .editorconfig by Terraform"
  overwrite_on_create = true
}
