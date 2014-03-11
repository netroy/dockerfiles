FROM netroy/base
MAINTAINER Aditya <aditya@netroy.in>

# Get postgresql 9.3 from official repos
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet --no-check-certificate -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get -y -q update && apt-get -y -q install postgresql-9.3 && apt-get -y clean > /dev/null

# Setup a mounted folder for data
VOLUME ["/var/lib/postgresql"]

# Expose postgresql port
EXPOSE 5432

# Copy over the config
ADD pg_hba.conf /usr/lib/postgresql/pg_hba.conf
ADD postgresql.conf /usr/lib/postgresql/postgresql.conf

# Start postgresql when the container starts
ADD run.sh /bin/postgresql
RUN chmod +x /bin/postgresql
CMD ["/bin/postgresql"]