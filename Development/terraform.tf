terraform {
  cloud {
    organization = "Application_Test"

    workspaces {
      name = "Development"
    }
  }
}