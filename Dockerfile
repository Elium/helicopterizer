FROM alpine:3.3

MAINTAINER frekele <leandro.freitas@softdevelop.com.br>

RUN echo "http://dl-6.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk update \
    && apk add \
       bash \
       curl \
       wget \
       git \
       python\
       py-pip \
       docker \
    && pip install --upgrade pip \
    && pip install awscli

ADD ./scripts /scripts

RUN chmod -R +x /scripts

ENV STORAGE_PROVIDER='' \
    BACKUP_NAME='' \
    BACKUP_VERSION='' \
    DATA_PATH='/data/' \
    GZIP_COMPRESSION='true' \
    CLEAN_DATA_BEFORE_RESTORE='false' \
    AWS_ACCESS_KEY_ID='' \
    AWS_SECRET_ACCESS_KEY='' \
    AWS_DEFAULT_REGION='us-east-1' \
    AWS_S3_BUCKET_NAME='' \
    AWS_S3_PATH='/'

ENTRYPOINT ["/scripts/run.sh"]

CMD [""]