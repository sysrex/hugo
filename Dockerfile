FROM alpine:3.11
MAINTAINER mail@alexkiss.dev

RUN apk add --update \
    git openssl py-pygments libc6-compat g++ curl \
  && rm -rf /var/cache/apk/*

ENV HUGO_VERSION 0.64.0
ENV HUGO_BINARY hugo
ENV HUGO_RESOURCE hugo_extended_${HUGO_VERSION}_Linux-64bit

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_RESOURCE}.tar.gz /tmp/

RUN  mkdir /tmp/${HUGO_RESOURCE} && tar -xvzf /tmp/${HUGO_RESOURCE}.tar.gz -C /tmp/${HUGO_RESOURCE}/ \
	&& mv /tmp/${HUGO_RESOURCE}/${HUGO_BINARY} /usr/bin/hugo && rm -rf /tmp/*

