resource "google_bigquery_dataset" "userdataset" {
  dataset_id                  = "userdataset"
  location                    = "NORTHAMERICA-NORTHEAST2"  # Choose the appropriate location for your dataset
}

resource "google_bigquery_table" "user_data" {
  dataset_id = google_bigquery_dataset.userdataset.dataset_id
  table_id   = "user_data"
  deletion_protection = false
  
  schema = <<-EOF
    [
      {
        "name": "Name",
        "type": "STRING"
      },
      {
        "name": "Email",
        "type": "STRING"
      },
      {
        "name": "Age",
        "type": "STRING"
      },      
      {
        "name": "Gender",
        "type": "STRING"
      },
      {
        "name": "Occupation",
        "type": "STRING"
      }
    ]
  EOF
}

