
export MYSQL_USER=avnadmin
export MYSQL_PASS=AVNS_UdFO-dURiJO3iAAjo5w
export MYSQL_URL=mysql-10b26404-bucoyas-d485.aivencloud.com
export MYSQL_DB=defaultdb
export MYSQL_PORT=24243
export SERVICE_URI=mysql://avnadmin:AVNS_UdFO-dURiJO3iAAjo5w@mysql-10b26404-bucoyas-d485.aivencloud.com:24243/defaultdb?ssl-mode=REQUIRED


mysql -u avnadmin -p AVNS_UdFO-dURiJO3iAAjo5w -h mysql-10b26404-bucoyas-d485.aivencloud.com
mysqlsh --sql SERVICE_URI

mysql --user avnadmin \
  --password=AVNS_UdFO-dURiJO3iAAjo5w \
  --host mysql-10b26404-bucoyas-d485.aivencloud.com \
  --port 24243 defaultdb