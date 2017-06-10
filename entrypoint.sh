#!/bin/bash
set -e

install() {
    echo "There are nothing to install"
}

tests() {
    echo "There are no tests"
}

run() {
    sed -i -e 's/MYSQL_MAX_CONNEXIONS/'$MYSQL_MAX_CONNEXIONS'/g' /etc/mysql/my.cnf
    chmod 0644 /etc/cron.d/cron-mysql.conf
    crontab -u root /etc/cron.d/cron-mysql.conf
    chmod 644 /etc/mysql/my.cnf
    env > /root/.bash_profile
    chmod 755 /root/.bash_profile
    
    echo '* Working around permission errors locally by making sure that "mysql" uses the same uid and gid as the host volume'
    TARGET_UID=$(stat -c "%u" /var/lib/mysql)
    echo '-- Setting mysql user to use uid '$TARGET_UID
    usermod -o -u $TARGET_UID mysql || true
    TARGET_GID=$(stat -c "%g" /var/lib/mysql)
    echo '-- Setting mysql group to use gid '$TARGET_GID
    groupmod -o -g $TARGET_GID mysql || true
    echo
    echo '* Starting MySQL'
    chown -R mysql:root /var/run/mysqld/
    supervisord
}

case "$1" in
"install")
    echo "Install"
    install
    ;;
"tests")
    echo "Tests"
    tests
    ;;
"run")
    echo "Run"
    run
    ;;
*)
    echo "Custom command : $@"
    exec "$@"
    ;;
esac
