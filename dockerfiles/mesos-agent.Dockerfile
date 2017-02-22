FROM wbaek/mesos:1.1.0-master
MAINTAINER Woonhyuk Baek <wbaek.personal@gmail.com>

ENTRYPOINT ["/usr/local/sbin/mesos-agent", "--work_dir=/var/share/mesos/work_dir"]
