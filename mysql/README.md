# Images Docker MySQL

[![](https://badge.imagelayers.io/livingobjects/mysql:latest.svg)](https://imagelayers.io/?images=livingobjects/mysql:latest 'Get your own badge on imagelayers.io')

Mysql 5.6 debian based

## Changelog

### 2017-05-17 - Version : mysql_5.6_11
* Update log policy to have rolling log files

### 2017-05-17 - Version : mysql_5.6_10
* New debian-base

### 2017-05-05 - Version : mysql_5.6_9
* Switch to debian-base:8.7_1

## Configuration

 * PORTS : [ `3306` ]
 * VOLUMES : [ `/etc/mysql`, `/var/lib/mysql` ]

At MySQL startup, if `/create_mysql_admin_user.sh` is present, it is executed, useful for initializing database

## Build

    docker build -t livingobjects/mysql .

## Annexes

### /create_mysql_admin_user.sh Example

    #!/bin/bash

    /usr/bin/mysqld_safe > /dev/null 2>&1 &

    RET=1
    while [[ RET -ne 0 ]]; do
        echo "=> Waiting for confirmation of MySQL service startup"
        sleep 5
        mysql -uroot -e "status" > /dev/null 2>&1
        RET=$?
    done

    echo "=> Creating MySQL user longback with ${_word} password"

    mysql -uroot -e "CREATE USER 'myuser'@'%' IDENTIFIED BY 'mypassword'"
    mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'myuser'@'%' WITH GRANT OPTION"

    echo "=> Done!"

    echo "========================================================================"
    echo "You can now connect to this MySQL Server using:"
    echo ""
    echo "    mysql -umyuser -pmypassword -h<host> -P<port>"
    echo ""
    echo "Please remember to change the above password as soon as possible!"
    echo "MySQL user 'root' has no password but only allows local connections"
    echo "========================================================================"

    mysqladmin -uroot shutdown