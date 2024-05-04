resource "google_bigquery_dataset" "userdataset" {
  dataset_id                  = "userdataset"
  location                    = "US-CENTRAL1"  # Choose the appropriate location for your dataset
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

resource "google_bigquery_routine" "my_procedure" {
  dataset_id = google_bigquery_dataset.userdataset.dataset_id
  routine_id = "my_procedure"
  routine_type = "PROCEDURE"
  
  /*
  arguments {
    name = "param1"
    data_type {
      type_kind = "INT64"
    }
  }

  arguments {
    name = "result"
    data_type {
      type_kind = "INT64"
    }
    mode = "OUT"
  }
  */

  language = "SQL"

  definition_body = <<-SQL
    CREATE OR REPLACE PROCEDURE `userdataset.my_procedure`(IN param1 INT64, OUT result INT64)
    BEGIN
      SET result = param1 * 2;
    END
  SQL
}
