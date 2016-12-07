#!/bin/bash
set -e

install() {
    echo "There are nothing to install"
}

tests() {
    echo "There are no tests"
}

run() {
    chmod 0644 /etc/cron.d/cron-mysql.conf
    crontab -u root /etc/cron.d/cron-mysql.conf
    chmod 644 /etc/mysql/my.cnf
    env > /root/.bash_profile
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
