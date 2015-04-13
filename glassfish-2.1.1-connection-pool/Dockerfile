FROM d10xa/glassfish-2.1.1

MAINTAINER Andrey Stolyarov <d10xa@mail.ru>

ENV \
    DOMAIN_NAME="domain1" \
    ADMIN_PASSWORD="adminadmin" \
    DATASOURCE_CLASS_NAME="com.mysql.jdbc.jdbc2.optional.MysqlDataSource" \
    ISOLATION_LEVEL="read-committed" \
    CONNECTION_POOL_DESCRIPTION="created by docker" \
    VALIDATION_METHOD="auto-commit" \
    CONNECTION_POOL_PROPERTIES="user=dbuser:password=dbpassword:zeroDateTimeBehavior=convertToNull:url=jdbc\\:mysql\\://localhost\\:3306/dbname" \
    CONNECTION_POOL_NAME="DockerConnectionPool" \
    JDBC_RESOURCE_NAME="jdbc/dockerdatabase"

RUN \
  wget \
  -P /opt/glassfish/domains/${DOMAIN_NAME}/lib/ext \
  http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.35/mysql-connector-java-5.1.35.jar

EXPOSE 8080 8181 4848 3700 3820 3920 8686

COPY . /root

CMD \
  sh /root/start-domain.sh && \
  sh /root/create-connection-pool.sh && \
  sh /root/deploy.sh && \
  sh /root/tailLog.sh


