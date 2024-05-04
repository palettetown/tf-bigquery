resource "google_storage_bucket" "function_bucket" {
  name     = "function-bucket-chris"
  location = "northamerica-northeast1"
}

resource "google_storage_bucket_object" "function_code" {
  name   = "function_code.zip"
  bucket = google_storage_bucket.function_bucket.name
  source = "C:\\MyPrograms\\GCP\\BigQuery\\GCS_TO_BQ\\function\\function_code.zip"  # Path to your Cloud Function code archive  
}

resource "google_storage_bucket_object" "requirements_txt" {
  name   = "requirements.txt"
  bucket = google_storage_bucket.function_bucket.name
  source = "C:\\MyPrograms\\GCP\\BigQuery\\GCS_TO_BQ\\function\\requirements.txt"  # Path to your requirements.txt file
}

resource "google_cloudfunctions_function" "trigger_dataflow_job" {
  name        = "trigger_df_job"
  runtime     = "python39"
  source_archive_bucket = google_storage_bucket.function_bucket.name
  source_archive_object = "function_code.zip"  # Path to your Cloud Function code archive
  #entry_point = "process_file"
  region = "northamerica-northeast1"
  
  event_trigger {
    event_type = "google.storage.object.finalize"
    resource   = google_storage_bucket.function_bucket.name
  }

  environment_variables = {
    # Add any environment variables if needed
  }
}

