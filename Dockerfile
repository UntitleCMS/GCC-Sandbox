FROM linuxserver/openssh-server:latest
LABEL org.opencontainers.image.source = "https://github.com/UntitleCMS/GCC-Sandbox"

ENV PUBLIC_KEY_FILE=/config/authorized_keys
ENV PUID=1000
ENV PGID=1000
ENV TZ=Etc/UTC
ENV SUDO_ACCESS=true
ENV USER_NAME=runner


RUN mkdir /sourcecode

RUN apk update && \
    apk add --no-cache gcc make musl-dev linux-headers libgcc g++ libc-dev cpulimit

RUN echo "cd /sourcecode" >> /config/.profile
COPY ./scripts/run /config/run
RUN chmod 777 /config/run
