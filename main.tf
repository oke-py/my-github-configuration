data "github_repositories" "mine" {
  query = "user:oke-py archived:false -topic:article -topic:presentation"
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
