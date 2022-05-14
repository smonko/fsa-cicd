terraform {
  cloud {
    organization = "fullstackacademy"

    workspaces {
      name = "fsa-cicd"
    }
  }
}