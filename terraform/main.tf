provider "local" {}

# Create a directory resource
resource "local_file" "example_directory" {
  filename = "/app/output/example_directory/hello_terraform.txt"
  content  = "This directory is managed by Terraform."
}

# 1. Try running as-is
# 2. Try changing the text
# 3. Try commenting it out
# Create a file inside the directory
resource "local_file" "example_file" {
  filename = "/app/output/example_directory/welcome.txt"
  content  = "Welcome to your Terraform-managed system whoopwhoop!\n"
}
