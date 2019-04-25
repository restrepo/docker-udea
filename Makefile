build:Dockerfile
	docker build --tag=sarah .
run:
	docker run -p 8000:8000 sarah jupyterhub-start

ls:
	docker container ls

login:
	docker login
