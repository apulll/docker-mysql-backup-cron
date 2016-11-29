#/bin/bash
date=`date "+%Y-%m-%d_%H:%M:%S"`
/usr/local/mysql/bin/mysqldump --verbose --user=root --password=$MYSQL_ROOT_PASSWORD --all-databases > /src/$date.sql