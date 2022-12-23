resource "github_repository_file" "editorconfig" {
  repository          = "ansible-osx"
  branch              = "main"
  file                = ".editorconfig"
  content             = file(".editorconfig")
  commit_message      = "Managed by Terraform"
  overwrite_on_create = true
}
