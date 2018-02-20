FROM softasap/alpine:python-2.7-36-0.0.1

ENV ANSIBLE_CONTAINER=1
ENV LANG=C.UTF-8
ENV ANSIBLE_CONTAINER_VERSION=0.9.2
ENV DOCKER_VERSION=17.04.0

RUN apk add --update make gcc g++ linux-headers libgcc libstdc++  \
    && apk add --update libffi-dev musl-dev python-dev openssl-dev \
    && apk add --update curl git openssl rsync wget ca-certificates && update-ca-certificates \
    && mkdir -p /etc/ansible/roles /_ansible/src && (curl https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}-ce.tgz | tar -zxC /usr/local/bin/ --strip-components=1 docker/docker ) \
    && wget -O ansible-container.tar.gz https://github.com/ansible/ansible-container/archive/release-${ANSIBLE_CONTAINER_VERSION}.tar.gz && tar -xzf ansible-container.tar.gz && rm ansible-container.tar.gz \
    && cp -r ansible-container-release-${ANSIBLE_CONTAINER_VERSION}/container /_ansible \
    && mkdir -p /_ansible/container/conductor-build && cp /ansible-container-release-${ANSIBLE_CONTAINER_VERSION}/*requirements*.* /_ansible/container/conductor-build \
    && cp /ansible-container-release-${ANSIBLE_CONTAINER_VERSION}/setup.py /_ansible/container/conductor-build \
    && cd /_ansible && pip install --no-cache-dir -r container/conductor-build/conductor-requirements.txt \
    && PYTHONPATH=. LC_ALL="en_US.UTF-8" python container/conductor-build/setup.py develop -v -N \
    && ansible-galaxy install -p /etc/ansible/roles -r container/conductor-build/conductor-requirements.yml
