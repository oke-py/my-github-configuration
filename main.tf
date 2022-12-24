data "github_repositories" "mine" {
  query = "org:oke-py archived:false"
}

resource "github_branch_protection_v3" "main" {
  for_each = toset(data.github_repositories.mine.names)

  repository = each.key
  branch     = "main"
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
