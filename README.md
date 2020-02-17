# CHALLENGE-1
# 3-tier-app-aws-terraform
Simple 3-tier app example deployed to AWS using Terraform.

# Requirements
- Terraform >= `0.11.1`
- `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variables exported.

# Usage
Clone this repository and run:

Initializing Terrraform remote backend:
```
cd 3-tier 
terraform init 

terraform plan:
terraform apply:

will output public ip
terraform output  

After the process is completed, should then be able to connect to 
`http://EC2_INSTANCE_IP/app1` and 
`http://EC2_INSTANCE_IP/app2` in your browser.

# References
- https://github.com/lbracken/docker-example (for the example 3-tier application)


# CHALLENGE-2
./2-getmetadata.py PUBLIC_IP


# CHALLENGE-3
./3-getVal.py
