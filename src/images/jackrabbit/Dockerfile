FROM tomcat:alpine

ADD jcr-2.0.jar /usr/local/tomcat/lib/
ADD jcrmanager.war /usr/local/tomcat/webapps/

ENV JCR_VERSION 2.16.1

RUN cd /root && \
wget http://ftp.unicamp.br/pub/apache/jackrabbit/$JCR_VERSION/jackrabbit-webapp-$JCR_VERSION.war && \
 mv jackrabbit-webapp-$JCR_VERSION.war /usr/local/tomcat/webapps/jackrabbit.war;

VOLUME /usr/local/tomcat/jackrabbit
