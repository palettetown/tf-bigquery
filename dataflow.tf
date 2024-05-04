resource "google_dataflow_job" "testjob" {
  name   = "testjob2"
  region = "northamerica-northeast2"
  project = "my-second-project-418213"

  template_gcs_path = "gs://dataflow-templates/latest/GCS_Text_to_BigQuery"
  temp_gcs_location = "gs://bkt-df-metadata-chris2/temp"

    parameters = {
      inputFilePattern = "gs://chris-landing-zone2/user.csv"  # Path to your input file in GCS
      #outputTableSpec  = "my-second-project-418213:userdataset.user_data"  # BigQuery table to write the data to
      javascriptTextTransformGcsPath = "gs://bkt-df-metadata-chris2/udf.js"  # Path to your JavaScript UDF file in GCS
      JSONPath = "gs://bkt-df-metadata-chris2/bq.json"
      outputTable = "my-second-project-418213:userdataset.user_data"
      bigQueryLoadingTemporaryDirectory = "gs://bkt-df-metadata-chris2/temp_dir"
      javascriptTextTransformFunctionName = "transform"      
    }  
  
}