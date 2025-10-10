### Terraform Modules

This project uses a modular Terraform structure to organize the infrastructure into logical components.

* **Networking:** Establishes the core network topology for the entire infrastructure. It creates the Virtual Network (VNet), public and private subnets, and essential routing components like Internet Gateways and route tables. This module's outputs are prerequisites for most other modules.
* **Compute:** Responsible for deploying the virtual machines (VMs) that form the application's compute backbone. It leverages the network configuration to place instances in the correct subnets and applies security groups to control traffic.
* **Load Balancer:** Manages traffic distribution by provisioning and configuring an Application Gateway or Load Balancer. It defines listener rules, sets up health checks to monitor instance health, and registers VMs with target groups to receive traffic.
* **Nginx:** Deploys and configures an Nginx server on the compute instances. This can function as a web server for static content or as a reverse proxy, managed via a `user_data.sh` script for automated setup on instance boot.

---

### CI/CD Pipeline Implementations

This repository provides two distinct CI/CD pipeline examples for deploying the Terraform infrastructure.

#### Azure Pipelines Workflow

This project implements a secure CI/CD workflow using Azure Pipelines to ensure infrastructure changes are managed safely and predictably. Every commit to the `main` branch automatically triggers the pipeline on a self-hosted agent.

The process is divided into key stages:
* **Plan:** The pipeline first runs `terraform init` and `terraform plan`. The resulting execution plan is archived as a secure artifact, providing a clear preview of the changes.
* **Manual Approval Gate:** To prevent unintended deployments, the pipeline pauses and requires a designated approver to review the plan artifact. This step ensures that all changes receive human sign-off.
* **Apply:** Once approved, a final job downloads the *exact same plan artifact* and executes `terraform apply`, guaranteeing that what was approved is exactly what gets deployed.

> **Note:** This requires a pre-configured self-hosted agent pool, an Azure service connection, and an "Environment" in Azure DevOps with designated approvers.

#### Jenkins Pipeline Workflow

This repository includes a `Jenkinsfile` for automating deployments via a declarative Jenkins pipeline, designed for security and control over the infrastructure lifecycle.

The pipeline begins by securely loading Azure credentials from the Jenkins credential store into the environment. The key stages are:
* **Authentication:** The pipeline first authenticates with Azure using the provided service principal credentials.
* **Plan:** It then runs `terraform init` and `terraform plan` within the `environments/dev` directory, saving the output to a `tfplan` file.
* **Manual Apply Trigger:** The `apply` stage is intentionally disabled by default for safety. To execute the plan, a user must manually trigger the build and enable the `APPLY_CHANGES` boolean parameter. This acts as a manual approval step, ensuring changes are only applied when explicitly requested.

> The pipeline concludes with a `post` action that cleans the workspace after each run.
