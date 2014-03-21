FROM ethankhall/tomcat-nginx

RUN apt-get install -y git unzip

RUN git clone https://github.com/Grubdice/grubdice.git /grubdice

WORKDIR /grubdice
RUN git checkout production 
RUN ./gradlew war
RUN rm -rf /var/lib/tomcat7/webapps/ROOT
#RUN unzip build/libs/grubdice.war /var/lib/tomcat7/webapps/ROOT

#ENTRYPOINT service nginx start && service tomcat7 start && tail -f /var/log/tomcat7/catalina.out
