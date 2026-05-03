FROM tomcat:9.0.117-jdk21
RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY target/dmart-clone.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
