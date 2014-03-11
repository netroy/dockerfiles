FROM netroy/base
MAINTAINER Aditya <aditya@netroy.in>

# Get mysql from ubuntu's repos
RUN apt-get -y -q install mysql-server mysql-client && apt-get -y clean > /dev/null

# Setup a mounted folder for data
VOLUME ["/var/lib/mysql"]

# Expose mysql's port
EXPOSE 3306

# Copy over the config
ADD my.cnf /etc/mysql/my.cnf

# Start mysql when the container starts
ADD run.sh /bin/mysql
RUN chmod +x /bin/mysql
CMD ["/bin/mysql"]