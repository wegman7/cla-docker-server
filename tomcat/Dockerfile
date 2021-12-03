FROM ubuntu:20.04

# updates
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install wget

# install tomcat
RUN mkdir /usr/local/tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.73/bin/apache-tomcat-8.5.73.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-8.5.73/* /usr/local/tomcat

# install java
RUN wget https://download.java.net/java/GA/jdk14.0.2/205943a0976c4ed48cb16f1043c5c647/12/GPL/openjdk-14.0.2_linux-x64_bin.tar.gz -O /tmp/java.tar.gz
RUN mkdir /usr/java
RUN cd /tmp && tar xvzf java.tar.gz -C /usr/java
ENV JAVA_HOME=/usr/java/jdk-14.0.2/
ENV JAVA_PATH=/usr/java/jdk-14.0.2/bin

# add arguments
ENV CATALINA_OPTS="-Dregion=atl -Denv=qa -DbackgroundImage=elmsreld"

# we can uncomment this to debug
# ENV JAVA_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,address=0.0.0.0:8080,server=y,suspend=y"

RUN mkdir /var/ELMSTemplates
RUN mkdir /var/CLAGeneratedReports
RUN mkdir /var/CLAGeneratedReports/tempfiles
RUN mkdir /var/ELMSDocumentShare
RUN touch /var/ELMSDocumentShare/SHARE_MOUNT_CHECK_FILE

# COPY ./document_templates /document_templates

# COPY ./tomcat/start.sh /
COPY ./start.sh /
EXPOSE 8080

CMD ["/start.sh"]