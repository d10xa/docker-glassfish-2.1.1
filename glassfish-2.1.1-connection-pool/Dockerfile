FROM d10xa/glassfish-2.1.1

MAINTAINER Andrey Stolyarov <d10xa@mail.ru>

ENV DOMAIN_NAME=domain1

RUN \
  cd /opt/glassfish/domains/${DOMAIN_NAME}/lib/ext && \
  wget http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.35/mysql-connector-java-5.1.35.jar

ENV GLASSFISH_HOST=localhost
ENV GLASSFISH_PORT=4848
ENV ADMIN_PASSWORD=adminadmin
ENV DATASOURCE_CLASS_NAME=com.mysql.jdbc.jdbc2.optional.MysqlDataSource 
ENV ISOLATION_LEVEL=read-committed
ENV CONNECTION_POOL_DESCRIPTION="created by docker"
ENV VALIDATION_METHOD="auto-commit"
ENV CONNECTION_POOL_PROPERTIES="user=dbuser:password=dbpassword:zeroDateTimeBehavior=convertToNull:url=jdbc\\:mysql\\://localhost\\:3306/dbname"
ENV CONNECTION_POOL_NAME=DockerConnectionPool
ENV JDBC_RESOURCE_NAME=jdbc/dockerdatabase

CMD \
  echo connection pool properties ${CONNECTION_POOL_PROPERTIES} && \
  cd /opt/glassfish/bin && \
  ./asadmin start-domain ${DOMAIN_NAME} && \
  echo AS_ADMIN_PASSWORD=${ADMIN_PASSWORD}>password.txt && \
  ./asadmin create-jdbc-connection-pool \
  --user admin \
  --passwordfile password.txt \
  --host ${GLASSFISH_HOST} \
  --port ${GLASSFISH_PORT} \
  --instance server1 \
  --datasourceclassname ${DATASOURCE_CLASS_NAME} \
  --restype javax.sql.DataSource \
  --isolationlevel "${ISOLATION_LEVEL}" \
  --description "${CONNECTION_POOL_DESCRIPTION}" \
  --validationmethod "${VALIDATION_METHOD}" \
  --property "${CONNECTION_POOL_PROPERTIES}" \
  ${CONNECTION_POOL_NAME} && \
  ./asadmin create-jdbc-resource \
  --user admin \
  --passwordfile password.txt \
  --connectionpoolid ${CONNECTION_POOL_NAME} \
  ${JDBC_RESOURCE_NAME} && \
  /bin/rm password.txt && \
  while ! tail -f /opt/glassfish/domains/${DOMAIN_NAME}/logs/server.log ; do sleep 1 ; done

EXPOSE 8080 8181 4848 3700 3820 3920 8686

