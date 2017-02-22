# distributedML

## setup
### Messos
* reference
```
http://mesos.apache.org/gettingstarted/
```
bq. single master mesos (without Zookeeper)

* build
  * docker build
```
docker build -f dockerfiles/mesos-master.Dockerfile -t wbaek/mesos:1.1.0-master .
docker build -f dockerfiles/mesos-agent.Dockerfile -t wbaek/mesos:1.1.0-agent .
```

* run
  * master
```
docker run -p 5050:5050 -v LOCAL_PATH:/var/share/mesos/work_dir wbaek/mesos:1.1.0-master
```
  * agent
```
docker run -v LOCAL_PATH:/var/share/mesos/work_dir wbaek/mesos:1.1.0-agent --master=127.0.0.1:5050
```

### Spark
* reference
```
http://spark.apache.org/docs/latest/running-on-mesos.html
```

* build
  * docker build
```
docker build -f dockerfiles/spark.Dockerfile -t wbaek/spark:2.1.0-hadoop2.6-mesos1.1.0 .
```

* run
```
docker run -p 8081:8081 wbaek/spark:2.1.0-hadoop2.6-mesos1.1.0 --webui-port 8081 --master mesos://HOST:5005
```


### Elephas(keras & spark)



