FROM ethankhall/tomcat-nginx

RUN apt-get install -y git unzip
RUN rm -rf /var/lib/tomcat7/webapps/ROOT

RUN echo 'JAVA_OPTS="${JAVA_OPTS} -Dspring.profiles.active=prod "' >> /etc/default/tomcat7
RUN echo 'DATABASE_URL="jdbc:postgresql://172.17.0.2:5432/grubdice?user=grubdice&password=grubdice"' >> /etc/default/tomcat7

ONBUILD RUN git clone https://github.com/Grubdice/grubdice.git /grubdice

ONBUILD WORKDIR /grubdice
ONBUILD RUN git checkout production 
ONBUILD RUN ./gradlew war
ONBUILD RUN unzip /grubdice/build/libs/grubdice.war -d /var/lib/tomcat7/webapps/ROOT

ENTRYPOINT service nginx start && service tomcat7 start && tail -f /var/log/tomcat7/catalina.out
