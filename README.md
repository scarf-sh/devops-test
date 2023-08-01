# Getting Started

This README file provides instructions on how to set up and run the "Hello, World!" application.

## Prerequisites

- Docker
- Kind
- GitHub Actions

## Instructions

1. Clone the repository:

```
git clone https://github.com/scarf-sh/devops-test.git
```

2. Create a new branch:
```
git clone https://github.com/scarf-sh/devops-test.git
```

3. Dockerize the application:

Create a Dockerfile with the following content:
```Dockerfile
FROM nginx:alpine
COPY ./src/index.html /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

4. Push the Docker image to a container registry:
5. GitHub Actions Workflow:
6. 
