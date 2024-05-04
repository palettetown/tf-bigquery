/*
resource "google_storage_bucket" "bkt-df-metadata-chris" {
  name          = "bkt-df-metadata-chris2"
  location      = "NORTHAMERICA-NORTHEAST2"
  force_destroy = true
}

resource "google_storage_bucket" "chris-landing-zone" {
  name          = "chris-landing-zone2"
  location      = "NORTHAMERICA-NORTHEAST2"
  force_destroy = true
}

resource "google_storage_bucket_object" "bq_json" {
  name   = "bq.json"
  source = "C:\\MyPrograms\\GCP\\BigQuery\\GCS_TO_BQ\\bq.json"
  bucket = google_storage_bucket.bkt-df-metadata-chris.name
}

resource "google_storage_bucket_object" "udf_js" {
  name   = "udf.js"
  source = "C:\\MyPrograms\\GCP\\BigQuery\\GCS_TO_BQ\\udf.js"
  bucket = google_storage_bucket.bkt-df-metadata-chris.name
}

resource "google_storage_bucket_object" "user_csv" {
  name   = "user.csv"
  source = "C:\\MyPrograms\\GCP\\BigQuery\\GCS_TO_BQ\\user.csv"
  bucket = google_storage_bucket.chris-landing-zone.name
}
*/