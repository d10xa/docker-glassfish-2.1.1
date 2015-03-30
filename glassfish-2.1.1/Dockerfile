FROM dockerfile/java:oracle-java6
WORKDIR /opt/glassfish
RUN \
  apt-get update && \
  apt-get -yq install wget && \
  cd /opt && \
  wget -O glassfish.jar http://dlc-cdn.sun.com/javaee5/v2.1.1_branch/promoted/Linux/glassfish-installer-v2.1.1-b31g-linux.jar && \
  echo A|java -jar glassfish.jar && \
  rm glassfish.jar && \
  cd /opt/glassfish && \
  chmod -R +x lib/ant/bin && \
  lib/ant/bin/ant -f setup.xml && \
  chmod a+x bin/asadmin