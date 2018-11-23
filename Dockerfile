#==== BEGIN DOCKER FILE
FROM centos:latest
RUN yum install -y java-1.8.0-openjdk-devel
RUN yum install -y unzip
RUN adduser tomcat
USER tomcat
RUN cd /home/tomcat && curl -L http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.8/bin/apache-tomcat-9.0.8.zip -o apache-tomcat-9.0.8.zip
RUN cd /home/tomcat 
RUN unzip apache-tomcat-9.0.8.zip 
RUN chmod -R 777 /home/tomcat
RUN ln -s apache-tomcat-9.0.8 tomcat
EXPOSE 8080
RUN cd /home/tomcat/tomcat/bin && chmod +x *.sh
ENTRYPOINT cd /home/tomcat/tomcat/bin && ./catalina.sh run
#==== END DOCKER FILE