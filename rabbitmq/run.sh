#!/bin/bash
set -e

if [ -f /.rabbitmq_password_set ]; then
  echo "RabbitMQ password already set!"
else
  USER=${RABBITMQ_USER:-"root"}
  PASSWORD=${RABBITMQ_PASS:-"root"}
  echo "=> Securing RabbitMQ with a password"
  cat > /etc/rabbitmq/rabbitmq.config <<EOF
  [
    {rabbit, [{default_user, <<"$USER">>},{default_pass, <<"$PASSWORD">>}]}
  ].
EOF
  echo "=> Done!"
  touch /.rabbitmq_password_set
fi



## Fix permissions
chmod -R 700 /var/lib/rabbitmq
chown -R rabbitmq /var/lib/rabbitmq

/usr/sbin/rabbitmq-server
