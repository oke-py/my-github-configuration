resource "github_repository" "example" {
  name        = "example"
  description = "Configure github.com/oke-py with Terraform"

  has_issues   = true
  has_projects = false
  has_wiki     = false

  allow_squash_merge     = false
  delete_branch_on_merge = true
}

resource "github_repository_file" "editorconfig" {
  repository          = "ansible-osx"
  branch              = "main"
  file                = ".editorconfig"
  content             = file(".editorconfig")
  commit_message      = "Managed by Terraform"
  overwrite_on_create = true
}
