# cla-docker-server

Put you elms project repo in the base directory.
The best way to run the containers is one at a time; first the java contianer which compiles the code, then the tomcat container.
First, comment out the tomcat service in the docker-compose file.
Then type command docker compose up --build
This will create the elms.war file in the persistant volume.
Next uncomment the tomcat service in the docker-compose file, and comment out the java service.
Run docker compose up --build again.
Assuming you don't see any errors, navigate to localhost:8080/elms
