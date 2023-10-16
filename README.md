# Azure Infrastructure Deployment using Terraform
## This repository contains Terraform configurations for deploying a scalable and secure infrastructure on Azure.

### Directory Structure
- `modules/`: Contains reusable Terraform modules for each component of the infrastructure.
- `environments/`: Environment-specific configurations (e.g., `prod`, `stage`).
- `global/`: Global configurations such as provider.
  
## Prerequisites

- Terraform v1.x
- Azure CLI

## Usage

1. Clone the repository:
   ```
   git clone https://github.com/luifa7/recommendooiac.git
   ```

2. Initialize terraform:
    ```
    cd recommendooiac/environments/prod
    terraform init
    ```

3. Apply the configuration:
    ```
    terraform apply
    ```
