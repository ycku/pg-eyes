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
	     && rc-status \
	     && touch /run/openrc/softlevel \
	     && rc-service postgresql start
	     
RUN mkdir -p /var/run/postgresql && chown -R postgres:postgres /var/run/postgresql && chmod 2777 /var/run/postgresql

ENV PGDATA /var/lib/postgresql/10
RUN chmod 777 "$PGDATA"
VOLUME /var/lib/postgresql/10

EXPOSE 5432

COPY docker-entrypoint.sh /
RUN chmod a+x docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["postgres"]
