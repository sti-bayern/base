FROM alpine:edge
LABEL maintainer="Guenther Morhart"

ENV LANG=de_DE.UTF-8
ENV MUSL_LOCPATH=/usr/share/i18n/locales/musl
ENV TZ=Europe/Berlin

COPY bin/ /usr/local/bin/
RUN echo 'https://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk add --no-cache \
        ca-certificates \
        su-exec \
        tzdata && \
    app-dir && \
    app-user && \
    app-timezone && \
    app-locale
COPY init/ /init/

ENTRYPOINT ["app-entry"]
CMD ["su-exec", "app", "sh"]