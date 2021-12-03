#!/bin/bash

# create symbolic link
ln -s /document_templates /var/ELMSTemplates/ELMSDocumentTemplateShare

# uncommenting either one of these commands will change server name (we can add this as an argument at runtime if we want)
# sed -i 's|autoDeploy="true">|autoDeploy="true">\n<Alias>jw0702-x-it-l.corp.clacorp.com</Alias>|' /usr/local/tomcat/conf/server.xml
# sed -i 's|name="localhost">|name="jw0702-x-it-l.corp.clacorp.com"|' /usr/local/tomcat/conf/server.xml

# copy war file from persistent volume
cp /elms-war/elms.war /usr/local/tomcat/webapps/ROOT.war
rm -r /usr/local/tomcat/webapps/ROOT
usr/local/tomcat/bin/catalina.sh run