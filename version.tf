terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.21.0"
    }
  }
}

provider "google" {
  # Configuration options
  credentials = file("C:\\MySoftware\\my-second-project-418213-93e3cfe420ae.json")
  project = "my-second-project-418213"
  region = "northamerica-northeast2"
}