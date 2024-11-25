#!/bin/bash

###
# Инициализируем роутер, бд, и заполняем данными
###

docker compose exec -T mongos_router mongosh --port 27020 <<EOF
sh.addShard( "shard1-rs/shard1:27027");
sh.addShard( "shard2-rs/shard2:27037");
sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name": "hashed" });
use somedb;
for(var i = 0; i < 1000; i++) db.helloDoc.insertOne({age:i, name:"ly"+i});
db.helloDoc.countDocuments();
EOF

