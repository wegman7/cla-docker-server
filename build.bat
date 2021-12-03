@REM build images
docker build -t java-image .
docker build -t tomcat-image ./tomcat

@REM create and start java container
docker create --name java --volume elms-war:/elms-war java-image
docker cp ./elms java:/usr/src/app
docker start -i java

@REM create and start tomcat container
docker create --name tomcat --mount type=bind,source=c:/users/jwegman/docker-server/document_templates,target=/document_templates --volume elms-war:/elms-war -p 8080:8080 tomcat-image
@REM uncomment this if we copy the war file instead
@REM docker cp java:/usr/src/app/target/elms.war .
@REM docker cp elms.war tomcat:/usr/local/tomcat/webapps/ROOT.war
docker start -i tomcat
