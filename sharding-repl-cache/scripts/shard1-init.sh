#!/bin/bash

###
# Инициализируем первый шард
###

docker compose exec -T shard1 mongosh --port 27027 <<EOF
rs.initiate(
    {
      _id: "shard1-rs",
      members: [
        { _id: 0, host: "shard1:27027" },
        { _id: 1, host: "shard1-replica1:27028" },
        { _id: 2, host: "shard1-replica2:27029" },
      ]
    }
);
EOF
