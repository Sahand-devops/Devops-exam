# DevOps Automation Project – User Management System

## Overview

This repository demonstrates an end-to-end DevOps automation pipeline that provisions infrastructure, configures a virtual machine, deploys a web application, validates delivery, and tears down resources.

Key technologies:
- Jenkins for CI/CD orchestration
- Terraform for Hyper-V infrastructure provisioning
- Ansible for VM configuration and application deployment
- SSH key authentication for secure automation

## Project Flow

1. Jenkins checks out the repository.
2. Terraform initializes, plans, and applies configuration to create an Ubuntu VM in Hyper-V.
3. Jenkins reads the VM IP address from Terraform outputs.
4. Ansible uses the provided SSH private key to connect to the VM.
5. Ansible installs `nginx`, deploys the `index.html` web page, and creates a deploy user with the public SSH key.
6. Jenkins verifies the web server by curling the VM URL.
7. The pipeline pauses for confirmation before executing `terraform destroy` to remove the VM.

## Repository Structure

- `Jenkinsfile` - Jenkins pipeline definition for provisioning, configuration, validation, and teardown.
- `terraform/` - Terraform configuration for Hyper-V VM creation and network setup.
- `ansible/` - Ansible playbook and inventory files used to configure the VM and deploy the web page.
- `.gitignore` - Ignore Terraform state and local environment files.

## Terraform Configuration

Terraform creates a Hyper-V virtual machine using:
- `hyperv_vhd` for disk creation from an existing template
- `hyperv_machine_instance` for VM provisioning
- outputs for VM name, state, and IP address

Configuration values are stored in `terraform/terraform.tfvars`.

## Ansible Configuration

The Ansible playbook in `ansible/playbook.yml` performs:
- creation of a `deploy` user
- deployment of the public SSH key for that user
- installation of `nginx`
- deployment of `ansible/index.html` to `/var/www/html/index.html`

## Usage

1. Ensure Jenkins has access to this repository.
2. Install and configure Hyper-V on the host.
3. Update `terraform/terraform.tfvars` with the correct Hyper-V host, credentials, switch, and VHD paths.
4. Make sure the `ansible/deploy_key` and `ansible/deploy_key.pub` files are present.
5. Run the Jenkins pipeline or execute Terraform/Ansible manually from the repository.

## Notes

- The pipeline uses `ssh` with `-o StrictHostKeyChecking=no` to avoid interactive host key prompts.
- The destroy stage requires manual approval in Jenkins before teardown.
- The web server is validated with a simple `curl` request after deployment.
