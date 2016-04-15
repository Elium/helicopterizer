FROM docker:1.11-dind

MAINTAINER frekele <leandro.freitas@softdevelop.com.br>

RUN apk add --no-cache \
              curl \
              wget \
              git \
              openssh-client \
              python

RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py

RUN pip install awscli

ADD ./scripts/*.sh /

RUN chmod +x /*.sh

ENTRYPOINT ["/helicopterizer-entrypoint.sh"]
CMD [""]
