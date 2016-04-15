FROM debian:jessie
MAINTAINER frekele <leandro.freitas@softdevelop.com.br>

RUN apt-get update && \
    apt-get install -y git curl wget python cron && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py

RUN pip install awscli

ADD /scripts/*.sh /

RUN chmod +x /*.sh

ENTRYPOINT ["/helicopterizer.sh"]
CMD [""]
