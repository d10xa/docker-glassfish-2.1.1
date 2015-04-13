echo connection pool properties ${CONNECTION_POOL_PROPERTIES} && \
echo AS_ADMIN_PASSWORD=${ADMIN_PASSWORD}>/tmp/password.txt && \
/opt/glassfish/bin/asadmin create-jdbc-connection-pool \
--user admin \
--passwordfile /tmp/password.txt \
--host localhost \
--port 4848 \
--instance server1 \
--datasourceclassname ${DATASOURCE_CLASS_NAME} \
--restype javax.sql.DataSource \
--isolationlevel "${ISOLATION_LEVEL}" \
--description "${CONNECTION_POOL_DESCRIPTION}" \
--validationmethod "${VALIDATION_METHOD}" \
--property "${CONNECTION_POOL_PROPERTIES}" \
${CONNECTION_POOL_NAME} && \
/opt/glassfish/bin/asadmin create-jdbc-resource \
--user admin \
--passwordfile /tmp/password.txt \
--connectionpoolid ${CONNECTION_POOL_NAME} \
${JDBC_RESOURCE_NAME} && \
/bin/rm /tmp/password.txt
