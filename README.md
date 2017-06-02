

# init mongodb config server
```
mongo --host mongodb-cfg-1 --port 27019
```
in the mogo shell
```
rs.initiate(
  {
    _id: "mongodbcfg",
    configsvr: true,
    members: [
     { _id: 0, host: "mongodb-cfg-1:27019" },
      { _id: 1, host: "mongodb-cfg-2:27019" },
      { _id: 2, host: "mongodb-cfg-3:27019" }
    ]
  }
)
```

# init mongodb shard - 1

```
mongo --host mongodb-1 --port 27018
```
in the mogo shell
```
rs.initiate(
  {
    _id : "mongodbshard-1",
    members: [
      { _id : 0, host : "mongodb-1:27018" },
      { _id : 1, host : "mongodb-2:27018" },
      { _id : 2, host : "mongodb-3:27018" }
    ]
  }
)
```

# init mongodb shard - 2

```
mongo --host mongodb-4 --port 27018
```
in the mogo shell
```
rs.initiate(
  {
    _id : "mongodbshard-2",
    members: [
      { _id : 0, host : "mongodb-4:27018" },
      { _id : 1, host : "mongodb-5:27018" },
      { _id : 2, host : "mongodb-6:27018" }
    ]
  }
)
```


# Add shards to mongos
```
mongo --host mongodb-router --port 27017
```
```
sh.addShard( "mongodbshard-1/mongodb-1:27018");
sh.addShard( "mongodbshard-2/mongodb-4:27018");
```
