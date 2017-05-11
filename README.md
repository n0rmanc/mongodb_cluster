
mongo --host mongodb-cfg-1 --port 27018


# init mongodb config server
```
mongo --host mongodb-cfg-1 --port 27019
```
in the mogo shell
```
rs.initiate(
  {
    _id: "mongos",
    configsvr: true,
    members: [
     { _id: 0, host: "mongodb-cfg-1:27019" },
      { _id: 1, host: "mongodb-cfg-2:27019" },
      { _id: 2, host: "mongodb-cfg-3:27019" }
    ]
  }
)
```

# init mongodb shard

```
mongo --host mongodb-1 --port 27018
```
in the mogo shell
```
rs.initiate(
  {
    _id : "mongos",
    members: [
      { _id : 0, host : "mongodb-1:27018" },
      { _id : 1, host : "mongodb-2:27018" },
      { _id : 2, host : "mongodb-3:27018" }
    ]
  }
)
```


# Add shards to mongos
```
mongo --host mongodb-router --port 27017
```
```
sh.addShard( "mongos/mongodb-1:27018");
sh.addShard( "mongos/mongodb-2:27018");
sh.addShard( "mongos/mongodb-3:27018");
```
