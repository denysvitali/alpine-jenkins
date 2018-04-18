FROM jenkins/jenkins:2.117-alpine

USER root

RUN apk -U add docker
# Setup Jenkins
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN apk add --update shadow \
    && groupadd -g 50 staff \
    && usermod -a -G staff jenkins && usermod -a -G docker jenkins
RUN apk add python3\ 
    rust\ 
    python\ 
    py2-pip\ 
    python3-dev\ 
    python2-dev\ 
    python-dev\ 
    libffi\ 
    libffi-dev\ 
    build-base\ 
    python-dev\ 
    py-pip\ 
    jpeg-dev\ 
    zlib-dev\ 
    cairo-dev\ 
    wget\ 
    ca-certificates

# Java FX
RUN cd /tmp && wget --quiet --output-document=/etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-java-openjfx/releases/download/8.151.12-r0/java-openjfx-8.151.12-r0.apk && \
    apk add --no-cache java-openjfx-8.151.12-r0.apk
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub && \
    apk --no-cache -X http://apkproxy.herokuapp.com/sgerrand/alpine-pkg-glibc add glibc glibc-bin
ENV LIBRARY_PATH=/lib:/usr/lib
USER root
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod u+x /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "bash", "/usr/local/bin/entrypoint.sh" ]
