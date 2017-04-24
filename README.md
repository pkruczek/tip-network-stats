# Docker container collecting network stats - TIP Project

### Run
`docker-compose up`

### Access [Chronograf][chronograf]
Chronograf is available on port 10000


### Access [InfluxDB Admin][influx-admin]
InfluxDB Admin is available on port 8083

### Standalone version
* Build image
```
docker build -t tip .
```

* Run image
```
docker run --net=host -p 10000:10000 tip
```

[chronograf]: http://localhost:10000
[Influx-admin]: http://localhost:8083