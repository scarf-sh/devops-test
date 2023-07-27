# How to deploy this application

To deploy this "Hello World" website using Nginx as a reverse proxy using Kind (Kubernetes in Docker) cluster, you need to follow these steps:

## Install the required tools:

- Docker: Install Docker on your machine if you haven't already.
- kubectl: Install the Kubernetes command-line tool kubectl.
- kind: Install kind, which will help you set up the Kubernetes cluster using Docker containers.
- AWS ECR: In a free AWS account you can create a public container registry repository. [Public repositories are always-free up to 50GB](https://aws.amazon.com/ecr/pricing/).


## Create a Dockerfile:
Create a file named `Dockerfile`, that might be in the root folder. The `Dockerfile` will define how to build the Nginx image with your website content.

### Dockerfile

```
FROM nginx:latest
COPY src/index.html /usr/share/nginx/html/index.html
````

## Build the Docker image:
Open your terminal, navigate to the project directory, and run the following command to build the Docker image:
```bash
docker build -t public.ecr.aws/u2q8s0h1/hello-world-nginx:latest .
```

## Push the Docker image to a container registry
Your Docker image needs to be stored in a container registry, private or public. There are several options like DockerHub, AWS ECR, Github Container Registry, etc. Let's use AWS ECR to accomplish this task.
Open your terminal and run the following commands to push the docker image to AWS ECR.

:exclamation: _You need to be authenticated to AWS, for that follow this [documentation](https://docs.aws.amazon.com/AmazonECR/latest/userguide/getting-started-cli.html)_


```bash
docker push public.ecr.aws/u2q8s0h1/hello-world-nginx:latest
```

## Create kind cluster
Create a kind cluster using the following command in your terminal:
```bash
kind create cluster --config cluster.yml
```
This will create a new Kubernetes cluster named "kind-static" using Docker containers as nodes.


## Deploy the application to the Kind cluster:
Open the manisfest file called `site-deployment.yml` and update container image name (line 19) with `public.ecr.aws/u2q8s0h1/hello-world-nginx:latest`

In your terminal, deploy the Kubernetes resources using kubectl:

```bash
kubectl apply -f site-deployment.yaml
```

## Deploy a Kubernetes service:
To access the website from outside the cluster, you need to expose it using a service. To achieve that you have to apply the file called `site-service.yml`

### Apply the service to the cluster:

```bash
kubectl apply -f site-service.yaml
```

## Access the website:
To find the NodePort assigned to the service, in our case it's `30950`. In case you want to check, run:

```bash
kubectl get service hello-world-service
```
The output will show the port under the "PORT(S)" column (e.g., 80:XXXXX/TCP).



Open your web browser and access the website using the NodePort:

```java
http://localhost:30950
```
