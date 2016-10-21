FROM alpine:3.4

RUN apk add --update coreutils && rm -rf /var/cache/apk/*

COPY etcd-aws-cluster /bin/etcd-aws-cluster
COPY etcd-aws-proxy /bin/etcd-aws-proxy

