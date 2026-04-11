# DevOps Automation Project – User Management System

## Overview

This project demonstrates how to build an automated deployment pipeline using DevOps tools. The goal is to automate the entire process from code to a running application.

When code is pushed to a Git repository, a CI/CD pipeline in Jenkins is triggered. Terraform is then used to provision a virtual machine in Hyper-V, and Ansible automatically configures the server and deploys a web application.

The project also includes a teardown process that automatically removes the infrastructure after use.
