docker run -it --rm \
  -v $(pwd):/app \
  --entrypoint /bin/sh \
  hashicorp/terraform:latest

# Then run:
# cd /app

# Initialize Terraform (required before running any configuration)
# terraform init

# Apply the configuration to create the resources
# terraform apply
