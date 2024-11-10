

# Hello World in ASP.NET
**This repository contains a simple "Hello World" application built using ASP.NET, which displays "Hello World" in the browser. The project is containerized with Docker, making it easy to run on any system that has Docker installed.**
---
## Requirements
- Docker desktop installed on your system.

---
## Quick Start
To get started with running this project locally, follow these steps:

1. Run the Docker Container
You can pull and run the Docker container with a single command:

   ~~~
   docker run -p 80:80 --name hello_world_csharp sebastianperez02/csharp_proyect
   ~~~
This command will:

- Pull the Docker image **sebastianperez02/csharp_proyect** from Docker Hub if it’s not already present.
- Run the container with the name hello_world_csharp.
- Map your local port 80 to the container's port 80.

2. View the Application
Once the container is running, open your web browser and go to:

~~~
http://localhost
~~~
### You should see the "Hello World" message displayed on the page.

3. Stopping the Container
To stop the container, use the following command:

~~~
docker stop hello_world_csharp
~~~
---
## To remove the container after stopping it:

~~~
docker rm hello_world_csharp
~~~

