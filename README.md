# AUTOMATED CI/CD WITH MODULAR INFRASTRUCTURE

### Scalable Cloud Infrastructure with Terraform and CI/CD

This project provides a **modular and reusable Terraform setup** for deploying scalable cloud infrastructure on **Azure**.  
It integrates with **Azure Pipelines** and **Jenkins** to automate Infrastructure as Code (IaC) workflows for consistent, repeatable deployments.

---

##  Modular Architecture

The infrastructure is split into independent **Terraform modules** for easier management and scalability:

- **Networking:** Creates Resource Group, Virtual Network, subnets, and dynamic NSG rules.
- **Compute:** Deploys VMs with customizable size, count, and configuration.
- **Load Balancer:** Implements an Azure Load Balancer or App Gateway to manage traffic.
- **Nginx:** Configures a simple Nginx setup on VMs for application testing or proxying.

---

##  Dynamic & Variablized Design

The setup is **fully parameterized** to support multiple environments like `dev` and `prod` without modifying module code.

**Highlights:**
- Dynamic variables for region, subnet CIDRs, and instance details.
- Environment tags auto-apply to resource names (`prod-vnet`, `dev-nsg`, etc.).
- Security rules and configurations passed through variables.
- Environment-specific `.tfvars` files (e.g., `dev.tfvars`, `prod.tfvars`).

This makes scaling or cloning environments simple and consistent.

<img width="362" height="759" alt="image" src="https://github.com/user-attachments/assets/716f05f6-986f-45a5-b09b-7dca33fc502d" />

<img width="1107" height="957" alt="image" src="https://github.com/user-attachments/assets/588fd337-4357-47af-a377-19246282d96b" />


* **Load Balancer Module:** Deploys a load balancer to ensure high availability by defining listener rules, running health checks, and distributing traffic across compute instances.
* **Nginx Module:** Deploys an Nginx server on each VM, configured to act as a web server or a reverse proxy.

---
### CI/CD Workflow: Plan, Review, Apply
The CI/CD workflow follows a safe **Plan-Review-Apply** process. A `terraform plan` is generated for manual review, and only after approval is the exact plan applied to the infrastructure, preventing unintended changes.
# Implementation 1: Azure Pipelines
<img width="2342" height="1099" alt="image" src="https://github.com/user-attachments/assets/235342b0-fb0f-481a-b4fb-ac32b5214b3a" />


### Secure CI/CD with Azure Pipelines

This repository uses a multi-stage Azure Pipeline to provide a secure, automated deployment workflow with a critical manual approval gate. The process ensures that all infrastructure changes are validated before execution.

1.  **Plan Stage:** When a commit is pushed to the `main` branch, the pipeline automatically triggers on a self-hosted agent. It runs `terraform plan` and saves the resulting execution plan as a secure build artifact.

2.  **Manual Approval Gate:** The pipeline then pauses, requiring a designated team member to review the saved plan. This crucial human-in-the-loop validation is managed through the Azure DevOps "Environments" feature and prevents accidental changes.

3.  **Apply Stage:** After approval, a final agent job downloads the *exact same plan artifact* from the first stage and executes `terraform apply`. This guarantees that the infrastructure deployed precisely matches what was reviewed and authorized.

---
#### Required Setup
To function correctly, this pipeline requires:
* A pre-configured self-hosted agent pool.
* A secure Azure service connection.
* An "Environment" in Azure DevOps configured with the necessary approvers.
# Implementation 2: Jenkins Pipeline
<img width="1600" height="248" alt="image" src="https://github.com/user-attachments/assets/c1b9d3b7-3057-4d33-8881-f2254007c78b" />
<img width="1600" height="344" alt="image" src="https://github.com/user-attachments/assets/cdf2e878-784e-41fc-b324-a34c7f1a3e92" />


### CI/CD with a Jenkins Pipeline

This repository also includes a declarative `Jenkinsfile` to automate deployments using a workflow that prioritizes security and manual control.

The process is as follows:
1.  **Secure Authentication:** The pipeline begins by loading Azure credentials from the Jenkins credential store and using them to authenticate with the Azure CLI.

2.  **Plan Generation:** Next, it runs `terraform init` and `terraform plan`, saving the proposed infrastructure changes to an execution plan file for review.

3.  **Manual Approval Gate:** The apply stage is intentionally disabled by default. To deploy the changes, a user must manually trigger the build and enable the `APPLY_CHANGES` boolean parameter. This acts as a purposeful approval step.

4.  **Predictable Deployment:** When the build is approved, the pipeline executes `terraform apply` using the saved plan file, guaranteeing that the deployed infrastructure precisely matches the generated plan.

> A `post` action automatically cleans the workspace after each build is complete.
 <img width="1108" height="493" alt="image" src="https://github.com/user-attachments/assets/69af263a-27d9-43d1-8d6e-6e30b47abc06" />
