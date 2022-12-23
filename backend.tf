terraform {
  cloud {
    organization = "oke-py"
    hostname     = "app.terraform.io"

    workspaces {
      name = "my-github-configuration"
    }
  }
}
