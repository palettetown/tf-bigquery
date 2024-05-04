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
  #credentials = file("C:\\MyPrograms\\GCP\\my-second-project-418213-c4584d61b2a8.json")
  project = "my-second-project-418213"
  region = "northamerica-northeast2"
  #set GOOGLE_CREDENTIALS=C:\MyPrograms\GCP\my-second-project-418213-c4584d61b2a8.json
}