echo "Setting up a retention policy"
influx -execute "CREATE DATABASE telegraf"
influx -execute "ALTER RETENTION POLICY \"autogen\" ON \"telegraf\" DURATION $RETENTION_POLICY_DURATION SHARD DURATION $SHARD_GROUP_DURATION"