FROM netroy/base

## Fetch Go-lang 1.2.1 from google code
ADD https://go.googlecode.com/files/go1.2.1.linux-amd64.tar.gz /tmp/go.tgz

## Extract it
RUN tar -C /usr/local -xzf "/tmp/go.tgz" && rm /tmp/go.tgz

## Envs
ENV GOROOT /usr/local/go
ENV PATH $GOROOT/bin:$PATH
