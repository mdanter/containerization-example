FROM registry.access.redhat.com/jboss-webserver-3/webserver30-tomcat8-openshift
USER root
RUN yum install -y wget && yum clean all
ENV CONFIG_DIR=/config \
    SECRET_DIR=/secret \
    LOG_DIR=/log
EXPOSE 8080
VOLUME $LOG_DIR \
       $SECRET_DIR
COPY run.sh /run.sh
COPY hello-world-1.0.0.war /opt/webserver/webapps/
RUN chown 1001:0 /run.sh ; chmod +x /run.sh
USER 1001
CMD [“/run.sh”]