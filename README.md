# What is anthonykgross/docker-mysql-backup-cron ?
This image is the easier way to install mysql server and crontable backup. Just edit the cron.conf and schedule when you want the backup will run.

##Prerequisites
Add your user to docker group to be able to use it with non root user: 
```console
$ sudo usermod -aG docker username
```

## Get docker-broadcaster
Download the repository on your public server.
```console
$ docker run --name akg-mysql -p 3306:3306 [ -e parameters ] anthonykgross/docker-mysql-backup-cron
```
or
```console
$ apt-get install git # For debian
$ git clone https://github.com/anthonykgross/docker-mysql-backup-cron.git
$ cd docker-mysql-backup-cron/
$ docker-compose up -d
```

## Parameters
You an find every useful directories in the **docker-compose.yml** and use the **--volume** docker parameter to override them by yours.
```console
$ docker run --name akg-mysql -p 3306:3306 --volume=$(pwd)/conf/cron.conf:/etc/cron.d/cron-mysql.conf anthonykgross/docker-mysql-backup-cron
```

## Creator
**Anthony K GROSS**
- <http://anthonykgross.fr>
- <https://twitter.com/anthonykgross>
- <https://github.com/anthonykgross>

## Copyright and license
Code and documentation copyright 2017. Code released under [the MIT license](https://github.com/kkuetnet/Harproject/blob/master/LICENSE).
