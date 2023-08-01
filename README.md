# Getting Started

This README file provides instructions on how to set up and run the "Hello, World!" application.

## Prerequisites

- Docker
- Kind
- GitHub Actions

## Instructions

### Clone the repository:

```
git clone https://github.com/scarf-sh/devops-test.git
```

### Create a new branch:
```
git checkout -b users/stephen
```

### Dockerize the application:

#### Create a Dockerfile with the following content:
```Dockerfile
FROM nginx:alpine
COPY ./src/index.html /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

#### Build the Docker image:
```Bash
docker build -t scarf_hello-world:latest .
```

#### Push the Docker image to a container registry:
```Dockerfile
docker login

# Replace stevendev with your Docker Hub (or container registry) username
docker push stevendev/scarf_hello-world:latest
```

### GitHub Actions Workflow To Build Kind Cluster:
#### Create a directory:
```Bash
mkdir .github/workflows
```

#### Add the following content to .github/workflows/deployment.yaml:
```Yaml
name: Deploy Kind Cluster

on:
 
  push:
    branches: [ users/stephen ]

jobs:
      create-cluster-and-deploy-k8s-yml-file:
        runs-on: ubuntu-latest
        steps:

          - name: Checkout users/stephen branch
            uses: actions/checkout@v2
            with:
              ref: users/stephen

          - name: Create k8s Kind Cluster
            uses: helm/kind-action@v1.5.0

          - name: Testing
            run: |
              #export KUBECONFIG="$(kind get kubeconfig-path)"
              kubectl cluster-info
              docker ps

          - name: Deploy Kubernetes YAML [Deployment & Service]
            run: |                
                kubectl apply -f site-deployment.yml
                kubectl apply -f site-service.yml
                kubectl get pods
                kubectl get svc

          - name: Teardown Kind Cluster
            run: |
                kubectl delete -f site-deployment.yml
                kubectl delete -f site-service.yml
                kind delete cluster
```
