FROM alpine:3.7

ENV LANG en_US.utf8

RUN set -ex && apk add --no-cache --virtual .fetch-deps \
		                   ca-certificates \
		                   openssl \
                       postgresql \
                       postgresql-dev \
                       make \
                       git \
                       openrc \
             && rm -rf /var/cache/apk/* \
             && touch /run/openrc/softlevel \
	     && rc-service postgresql start 
	     
EXPOSE 5432

CMD ["sh"]
