#!/bin/bash

###
# Инициализируем второй шард
###

docker compose exec -T shard2 mongosh --port 27037 <<EOF
rs.initiate(
    {
      _id: "shard2-rs",
      members: [
        { _id: 0, host: "shard2:27037" },
        { _id: 1, host: "shard2-replica1:27038" },
        { _id: 2, host: "shard2-replica2:27039" },
      ]
    }
);
EOF
