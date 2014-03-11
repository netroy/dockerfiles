#!/bin/bash
set -e

if [ ! -f /var/lib/mysql/ibdata1 ]; then

  ## Setup DB
  mysql_install_db

  ## Open up access
  /usr/sbin/mysqld &
  sleep 10s
  echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql

  ## Clean up
  killall mysqld
  sleep 10s
fi

## Fix permissions
chmod -R 744 /var/run/mysqld /var/lib/mysql
chown -R mysql /var/run/mysqld /var/lib/mysql

/usr/bin/mysqld_safe --log-error=/var/lib/mysql/error.log
