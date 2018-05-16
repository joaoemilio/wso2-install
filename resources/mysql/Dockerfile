FROM mysql:5.7
ENV MYSQL_ROOT_PASSWORD=rootroot
ENV MYSQL_DATABASE=wso2
ENV MYSQL_USER=wso2carbon
ENV MYSQL_PASSWORD=wso2carbon
VOLUME /home/joaoemilio/mysql:/var/lib/mysql
VOLUME /tmp/resources/mysql/scripts/:/docker-entrypoint-initdb.d
