# AUTOMATED CI/CD WITH MODULAR INFRASTRUCTURE
 
### Scalable Cloud Infrastructure with Terraform and CI/CD

This project provides a blueprint for deploying a scalable cloud architecture using a modular Terraform design. It includes example CI/CD implementations for both **Azure Pipelines** and **Jenkins**, demonstrating a safe and repeatable workflow for managing Infrastructure as Code (IaC).

---
### Modular Architecture
The infrastructure is defined using distinct Terraform modules, creating a layered and easily maintainable design:

* **Networking Module:** Establishes the foundational network layer, including the Virtual Network (VNet), subnets, route tables, and core security groups. This is the first layer to be deployed.
* **Compute Module:** Provisions the application's virtual machines (VMs), connecting them to the appropriate subnets and security groups defined by the networking layer..


<img width="460" height="1383" alt="image" src="https://github.com/user-attachments/assets/6087c047-f72e-42e9-820a-b90c4e1df534" />
<img width="1107" height="957" alt="image" src="https://github.com/user-attachments/assets/588fd337-4357-47af-a377-19246282d96b" />


Load Balancer Module: Deploys and configures a load balancer to distribute incoming traffic efficiently across the compute instances, defining listener rules and health checks.

Nginx Module: Configures an Nginx server, which can function as a web server or a reverse proxy to route traffic based on application logic.

CI/CD Workflow: Plan, Review, Apply
To ensure safety and predictability, both pipeline implementations follow a core "Plan-Review-Apply" workflow. This process generates a preview of infrastructure changes, requires human oversight before execution, and guarantees that only approved changes are deployed.

# Implementation 1: Azure Pipelines
<img width="2342" height="1099" alt="image" src="https://github.com/user-attachments/assets/235342b0-fb0f-481a-b4fb-ac32b5214b3a" />


This repository includes a multi-stage Azure Pipeline that automates deployment with a critical safety gate.

Process: The pipeline first executes a Plan stage on a self-hosted agent after receiving a commit to the main branch. This step creates an execution plan, verifies the Terraform code, and saves the plan as a secure build artefact.

Manual Approval: After the pipeline pauses, the saved plan must be manually reviewed and approved by an authorised user using the Azure DevOps "Environments" feature. Preventing unintended changes requires this human-in-the-loop validation.

Assurance of Execution: After approval, the Apply phase starts. Terraform apply is run by a new agent job that downloads the precise plan artefact from the first stage. This guarantees that the infrastructure that is deployed precisely corresponds to what was examined and authorised.

This setup requires, a self-hosted agent pool, an Azure service connection, and an environment set up with 

# Implementation 2: Jenkins Pipeline
<img width="1600" height="248" alt="image" src="https://github.com/user-attachments/assets/c1b9d3b7-3057-4d33-8881-f2254007c78b" />
<img width="1600" height="344" alt="image" src="https://github.com/user-attachments/assets/cdf2e878-784e-41fc-b324-a34c7f1a3e92" />


 Additionally, a declarative Jenkinsfile is offered for Jenkins deployment automation.

 Procedure: The pipeline loads Azure credentials from the Jenkins credential store in a secure manner first.  Azure authentication is done in the first step.  Terraform init and Terraform plan are executed in the following step, and the execution plan that is produced is saved to a file.

 Manual Approval: The last Apply step is optional and will not execute automatically.  A boolean parameter called APPLY_CHANGES must be enabled and the build must be manually triggered in order for the changes to be implemented.  This parameter serves as a purposeful manual approval process.

 Guaranteed Execution: Terraform is applied using the saved plan file in the final stage when the APPLY_CHANGES parameter is true, guaranteeing a predictable deployment.  The workspace is automatically cleaned by a post-build action.
 <img width="1108" height="493" alt="image" src="https://github.com/user-attachments/assets/69af263a-27d9-43d1-8d6e-6e30b47abc06" />
