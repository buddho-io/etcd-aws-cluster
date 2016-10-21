FROM alpine:3.4

RUN apk --update \
	add \
	coreutils \
	python \
	py-pip \
	jq \
	curl \
	wget \
	bash && \
	pip install --upgrade awscli && \
	mkdir /root/.aws && \
	rm -rf /var/cache/apk/*

# Expose volume for adding credentials
VOLUME ["/root/.aws"]

# Expose directory to write output to, and to potentially read certs from
VOLUME ["/etc/sysconfig/", "/etc/certs"]

COPY etcd-aws-cluster /bin/etcd-aws-cluster
COPY etcd-aws-proxy /bin/etcd-aws-proxy

