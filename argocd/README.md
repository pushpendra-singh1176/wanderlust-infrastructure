# ArgoCD - GitOps Deployment

This directory contains the ArgoCD configuration used to deploy the **Wanderlust** application into the Amazon EKS cluster using the GitOps methodology.

---

# Overview

ArgoCD continuously monitors the Infrastructure Repository and automatically synchronizes Kubernetes manifests with the EKS cluster whenever changes are pushed to GitHub.

---

# Repository Structure

```text
argocd/
│── app-project.yaml
│── application.yaml
└── README.md
```

---

# Components

## AppProject

Defines the project boundaries for the Wanderlust application.

Features:

- Restricts Git repositories
- Restricts deployment destinations
- Controls cluster resources
- Controls namespace resources

File:

```text
app-project.yaml
```

---

## Application

Defines the GitOps application managed by ArgoCD.

Features:

- Watches Infrastructure Repository
- Deploys Kubernetes manifests
- Automatic Sync
- Self Healing
- Resource Pruning

File:

```text
application.yaml
```

---

# GitOps Workflow

```text
Developer
      │
      ▼
GitHub Actions
      │
      ▼
DockerHub
      │
      ▼
Infrastructure Repository
      │
      ▼
ArgoCD
      │
      ▼
Amazon EKS
      │
      ▼
Application Updated
```

---

# Sync Policy

Current configuration:

- Automated Sync
- Self Heal
- Prune Resources
- Create Namespace Automatically

```yaml
syncPolicy:
  automated:
    prune: true
    selfHeal: true

  syncOptions:
    - CreateNamespace=true
```

---

# Deploy ArgoCD

Create Namespace

```bash
kubectl create namespace argocd
```

Install ArgoCD

```bash
kubectl apply -n argocd \
-f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

---

# Apply Project

```bash
kubectl apply -f app-project.yaml
```

---

# Apply Application

```bash
kubectl apply -f application.yaml
```

---

# Verification

Check Namespace

```bash
kubectl get ns
```

Check Pods

```bash
kubectl get pods -n argocd
```

Check Applications

```bash
kubectl get applications -n argocd
```

---

# Expected Deployment

After synchronization ArgoCD deploys:

- MongoDB
- Redis
- Backend
- Frontend
- Ingress

---

# Auto Deployment Flow

Whenever a new Docker image is built:

1. GitHub Actions pushes the image to DockerHub.
2. GitHub Actions updates the Kubernetes image tag in the Infrastructure Repository.
3. ArgoCD detects the Git commit.
4. ArgoCD synchronizes the cluster.
5. Kubernetes performs a Rolling Update automatically.

No manual deployment is required.

---

# Technologies Used

- ArgoCD
- Kubernetes
- Amazon EKS
- GitHub Actions
- DockerHub
- GitOps

---

# Author

**Dev.pushpendra**

DevOps Engineer



## Installation Method

### Version 2.0
- Manual Installation using kubectl

### Version 3.0
- Installed using Terraform + Helm Provider