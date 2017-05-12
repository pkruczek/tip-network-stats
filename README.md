# Docker container collecting network stats - TIP Project

### How to run and build Docker image?

#### Clone Git repository

```
git clone https://github.com/pkruczek/tip-network-stats.git
```
#### Get into project directory
```
cd tip-network-stats
```
#### Build Docker image
```
docker build -t tip .
```
#### Run Docker container
```
docker run --net=host -p 10000:10000 tip
```
Explanation:
* `--net=host` - this flags set host's network as container network. It's required because docker creates dedicated network for containers.
* `-p 10000:10000` - bind container's port 10000 to host's 10000. It allows to access Chronograf dashboards on [http://localhost:10000][chronograf]

### Access [Chronograf][chronograf]
Chronograf is available on port 10000

#### Custom Chronograf dashboard
This image contains simple Chronograf dashboard prepared. 


### Access [InfluxDB Admin][influx-admin]
InfluxDB Admin is available on port 8083 (run with flag `-p 8083:8083`)

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
docker run --net=host -v $PWD/chronograf.db:/var/lib/chronograf/chronograf.db -p 10000:10000 tip

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