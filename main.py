import hashlib
import logging
import sys
import os

from turbine.runtime import RecordList, Runtime

logging.basicConfig(level=logging.INFO)

def anonymize(records: RecordList) -> RecordList:
  logging.info(f"processing {len(records)} record(s)")
  for record in records:
    logging.info(f"input: {record}")
    try:
      payload = record.value["payload"]

      # Hash the email
      # This payload may be delivered as a bytetype.
      # expect errors
      payload["source"] = hashlib.sha256(
              payload["source"].encode("utf-8")
                                    ).hexdigest()

      logging.info(f"output: {record}")
    except Exception as e:
      print("Error occurred while parsing records: " + str(e))
      logging.info(f"output: {record}")
  return records


class App:
  @staticmethod
  async def run(turbine: Runtime):
    try:
      # To configure your data stores as resources on the Meroxa Platform
      # use the Meroxa Dashboard, CLI, or Meroxa Terraform Provider.
      # For more details refer to: https://docs.meroxa.com/

      # Identify an upstream data store for your data app
      # with the `resources` function.
      # Replace `source_name` with the resource name the
      # data store was configured with on the Meroxa platform.
      source = await turbine.resources("kafka-transactions")

      # Specify which upstream records to pull
      # with the `records` function.
      # Replace `collection_name` with a table, collection,
      # or bucket name in your data store.
      # If you need additional connector configurations, replace '{}'
      # with the key and value, i.e. {"incrementing.field.name": "id"}
      
      
      ### Kafka Topics
      
      #records = await source.records("queueing.transactions", {})
      records = await source.records("streaming.transactions.legit", {})
      #records = await source.records("streaming.transactions.fraud", {})

      # Specify which secrets in environment variables should be passed
      # into the Process.
      # Replace 'PWD' with the name of the environment variable.
      turbine.register_secrets("MYSQL_USER")
      turbine.register_secrets("MYSQL_PASS")
      
      # Specify what code to execute against upstream records
      # with the `process` function.
      # Replace `anonymize` with the name of your function code.
      anonymized = await turbine.process(records, anonymize)

      # Identify a downstream data store for your data app
      # with the `resources` function.
      # Replace `destination_name` with the resource name the
      # data store was configured with on the Meroxa platform.
      destination_db = await turbine.resources("mysql_db")

      # Specify where to write records downstream
      # using the `write` function.
      # Replace `collection_archive` with a table, collection,
      # or bucket name in your data store.
      # If you need additional connector configurations, replace '{}'
      # with the key and value, i.e. {"behavior.on.null.values": "ignore"}
          ## await destination_db.write(anonymized, "collection_archive", {})
      await destination_db.write(anonymized, f"kafka_legittransactions_backup")
    except Exception as e:
      print(e, file=sys.stderr)
