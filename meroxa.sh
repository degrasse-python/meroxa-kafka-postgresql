export KAFKA_BOOTSTRAP_SERVER=kafka-756e217-bucoyas-d485.aivencloud.com:24256
export CCLOUD_BOOTSTRAP_SERVER=pkc-419q3.us-east4.gcp.confluent.cloud:9092
export CCLOUD_API_SECRET=YovBCHgFdz9ThG6BAN6kZ7Svx8iMChe+N7p+hZjDXTVHNHHmF4iEeqUtK42KgaY9
export CCLOUD_USERNAME=PIMCPYQB7WBGFQLP
export CCLOUD_PASSWORD=5bdm6NEut8AXP8rhAsfaxi1QIfhSW+gqHeCJKep8cP6+mEMI2qRqhCbTO4sFUrmo
export CCLOUD_API_KEY=5KCIRAMEPW57NJA5
export KAFKA_BOOTSTRAP_APISERVER=kafka-756e217-bucoyas-d485.aivencloud.com:24243
export KAFKA_USERNAME=avnadmin
export KAFKA_CONNECT_PASSWORD=AVNS_p44xLzBwdl2BlgGT2vh
export API_SECRET=AVNS_R2dxCmeDp5omOOWTQ3m
export LEGIT_TOPIC=streaming.transactions.legit
export FRAUD_TOPIC=streaming.transactions.fraud
export TRANSACTIONS_TOPIC=queueing.transactions
export TRANSACTIONS_PER_SECOND=1000


export API_SECRET=m7La3yFDD3f5LCO3NXDJ7yi7U1IdxCPfJlxzuH3oasHdj1IGJvCFPhgN50ksTzIG
export API_KEY=IABXXYWUFETX5E4C

# mysql
export MYSQL_USER=avnadmin
export MYSQL_PASS=AVNS_UdFO-dURiJO3iAAjo5w
export MYSQL_URL=mysql-10b26404-bucoyas-d485.aivencloud.com
export MYSQL_DB=defaultdb
export MYSQL_PORT=24243


# Create first resource 
# THIS WORKS!!!
meroxa resource create kafka-transactions \
  --type confluentcloud \
  --url "kafka+sasl+ssl://$CCLOUD_USERNAME:$CCLOUD_PASSWORD@$CCLOUD_BOOTSTRAP_SERVER?sasl_mechanism=plain" \

# Create second resource 
# THIS WORKS!!!
meroxa resource create mysql_db \
--type mysql \
--url mysql://$MYSQL_USER:$MYSQL_PASS@$MYSQL_URL:$MYSQL_PORT/$MYSQL_DB