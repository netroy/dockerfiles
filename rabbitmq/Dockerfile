FROM netroy/base
MAINTAINER Aditya <aditya@netroy.in>

# Get rabbitmq from official repos
RUN echo "deb http://www.rabbitmq.com/debian/ testing main" > /etc/apt/sources.list.d/rabbitmq.list
RUN wget -qO - http://www.rabbitmq.com/rabbitmq-signing-key-public.asc | apt-key add -
RUN apt-get -y -q update && apt-get -y -q install rabbitmq-server && apt-get -y clean > /dev/null
RUN rabbitmq-plugins enable rabbitmq_management
RUN echo "rabbitmq    soft   nofile   10000" > /etc/security/limits.d/rabbitmq.conf

# Setup a mounted folder for data
VOLUME ["/var/lib/rabbitmq"]
ENV RABBITMQ_MNESIA_BASE /var/lib/rabbitmq

# Expose ports for RabbitMQ and RabbitMQ Adminm
EXPOSE 5672 15672 55672

# Start rabbitmq when the container starts
ADD run.sh /bin/rabbitmq
RUN chmod +x /bin/rabbitmq
ENTRYPOINT ["/bin/rabbitmq"]
