# Terraform Infrastructure - Wanderlust

This directory contains the Terraform configuration used to provision the complete AWS infrastructure for the **Wanderlust** project.

---

## Infrastructure Overview

Terraform provisions the following AWS resources:

- Amazon VPC
- Public & Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- IAM Roles
- Security Groups
- Amazon EKS Cluster
- EKS Managed Node Group
- Amazon S3 Bucket (Artifacts)
- Remote Terraform State (S3 Backend)
- State Locking (DynamoDB)

---

## Project Structure

```text
terraform/
│── backend.tf
│── provider.tf
│── versions.tf
│── variables.tf
│── terraform.tfvars
│── locals.tf
│── main.tf
│── outputs.tf
└── README.md
```

---

## Prerequisites

Before deploying the infrastructure, make sure the following are installed:

- Terraform v1.14+
- AWS CLI v2
- kubectl
- Git

---

## Deployment Workflow

### 1. Configure AWS CLI

```bash
aws configure
```

Verify credentials:

```bash
aws sts get-caller-identity
```

---

### 2. Initialize Terraform

```bash
terraform init
```

---

### 3. Validate Configuration

```bash
terraform validate
```

---

### 4. Preview Infrastructure

```bash
terraform plan
```

---

### 5. Deploy Infrastructure

```bash
terraform apply
```

---

## Resources Created

After a successful deployment Terraform provisions:

- VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- IAM Roles
- Security Groups
- Amazon EKS Cluster
- EKS Managed Node Group
- Amazon S3 Bucket

---

## Configure kubectl

After the EKS cluster is created:

```bash
aws eks update-kubeconfig --region ap-south-1 --name <cluster-name>
```

Verify:

```bash
kubectl get nodes
```

---

## Destroy Infrastructure

To remove all resources:

```bash
terraform destroy
```

---

## Best Practices

- Store Terraform state remotely using Amazon S3.
- Enable state locking using DynamoDB.
- Never commit AWS credentials.
- Do not commit the `.terraform/` directory.
- Commit `.terraform.lock.hcl` to maintain consistent provider versions.
- Validate infrastructure using `terraform plan` before every deployment.

---

## Tech Stack

- Terraform
- AWS
- Amazon EKS
- Amazon VPC
- IAM
- S3
- DynamoDB

---

## Author

**Dev.pushpendra**

DevOps Engineer