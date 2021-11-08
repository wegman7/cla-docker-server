FROM ubuntu:20.04

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install wget
RUN mkdir /usr/local/tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.72/bin/apache-tomcat-8.5.72.tar.gz -O /tmp/tomcat.tar.gz

RUN cd /tmp && tar xvfz tomcat.tar.gz

RUN cp -Rv /tmp/apache-tomcat-8.5.72/* /usr/local/tomcat

RUN wget https://download.java.net/java/GA/jdk14.0.2/205943a0976c4ed48cb16f1043c5c647/12/GPL/openjdk-14.0.2_linux-x64_bin.tar.gz -O /tmp/java.tar.gz
RUN mkdir /usr/java
RUN cd /tmp && tar xvzf java.tar.gz -C /usr/java
ENV JAVA_HOME=/usr/java/jdk-14.0.2/
ENV JAVA_PATH=/usr/java/jdk-14.0.2/bin

# if you decide to use a tomcat image you will have to manually change the java version (none of the tomcat images come with jdk 14)
# RUN update-alternatives --install /usr/bin/java java ${JAVA_HOME%*/}/bin/java 20000
# RUN update-alternatives --install /usr/bin/javac javac ${JAVA_HOME%*/}/bin/javac 20000
# RUN update-alternatives --config java

# remove from path
# directory_to_remove=/d/Programme/cygwin/bin
# PATH=:$PATH:
# PATH=${PATH//:$directory_to_remove:/:}
# PATH=${PATH#:}; PATH=${PATH%:}

ENV CATALINA_OPTS="-Dregion=atl -Denv=qa -DbackgroundImage=elmsreld"

EXPOSE 8080

CMD /usr/local/tomcat/bin/catalina.sh jpda run