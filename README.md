# Docker container collecting network stats - TIP Project

### Run
```
docker-compose up
```

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

* Run with custom chronograf.db (saved dashboards in Chronograf)
```
docker run --net=host -v $PWD/chronograf.db:/chronograf/chronograf.db -p 8083:8083 -p 8086:8086 -p 10000:10000 tip

```

### Hints
* Run image as named container
```
docker run --rm --net=host -p 8083:8083 -p 8086:8086 -p 9092:9092 -p 10000:10000 --name network-stats tip
```

* Log into the container
```
docker exec -ti network-stats /bin/bash
```

* Stop container
```
docker stop network-stats
```

[chronograf]: http://localhost:10000
[Influx-admin]: http://localhost:8083