IMAGE_NAME="hello-world-1"

build:
		docker build -t ${IMAGE_NAME} .

run:
		docker run -d -p 8080:80 ${IMAGE_NAME}
		$(info Access static hello-world site here - http://localhost:8080)