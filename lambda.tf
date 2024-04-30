# Lambda Function
resource "aws_lambda_function" "my_lambda_function" {
    depends_on = [ aws_iam_role_policy_attachment.lambda_execution_attachment, data.archive_file.lambda_zip ]
  function_name    = "my_lambda_function"
  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_path_base64sha256
  role             = aws_iam_role.lambda_execution_role.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.8"
}

data "archive_file" "lambda_zip" {
  type = "zip"
  source_file = "${path.module}/lambda_function.py"
  output_path = "${path.module}/lambda_zips.zip"

}