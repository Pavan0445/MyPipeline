provider "aws" {
  region = "us-east-1"  # Change this to your desired AWS region
}

resource "aws_ssm_parameter" "example" {
  name        = "MyParameter"  # The name of the SSM parameter
  description = "My SSM Parameter"  # Optional description for the parameter
  type        = "String"  # The data type of the parameter (String, SecureString, or StringList)
  value       = "MyParameterValue"  # The value you want to store in the parameter
  overwrite   = true  # Set to true to allow overwriting an existing parameter with the same name
}

output "ssm_parameter_name" {
  value = aws_ssm_parameter.example.name
}
