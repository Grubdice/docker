FROM ethankhall/tomcat-nginx

RUN apt-get install -y git unzip

RUN git clone https://github.com/Grubdice/grubdice.git /grubdice

WORKDIR /grubdice
RUN git checkout production 
RUN ./gradlew war
RUN rm -rf /var/lib/tomcat7/webapps/ROOT
RUN unzip /grubdice/build/libs/grubdice.war -d /var/lib/tomcat7/webapps/ROOT

RUN echo 'JAVA_OPTS="${JAVA_OPTS} -Dspring.profiles.active=prod "' >> /etc/default/tomcat7

ENTRYPOINT service nginx start && service tomcat7 start && tail -f /var/log/tomcat7/catalina.out
