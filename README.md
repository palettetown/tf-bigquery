# tf-bigquery
tf for bigquery

https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_routine

Calling script:

begin
declare result int64;

CALL `my-second-project-418213.userdataset.my_procedure`(1,result);

select result;

end;