FROM ghcr.io/onedr0p/ubuntu:rolling@sha256:80f141c34aa7a28393f51e40b6af5cac5bf5a8886a6e03fdbc3500eaa38407d5 

ARG VERSION

USER root

# hadolint ignore=DL3018
RUN \
  apt-get -qq update && \
  apt-get -qq install -y \
  openssh-server && \
  curl --silent --location https://github.com/borgbackup/borg/releases/download/${VERSION}/borg-linux64 --output /usr/local/bin/borg && \
  chmod a+x /usr/local/bin/borg

COPY apps/borgserver/entrypoint.sh /entrypoint.sh
COPY apps/borgserver/sshd_config /etc/ssh/sshd_config
COPY apps/borgserver/sample_client_key /config/clients/sample_client_key

RUN \
  deluser kah && \
  adduser borg \
    --uid 568 \
    --group \
    --system \
    --disabled-password \
    --shell /bin/bash \
  && \
  chown -R borg:borg /app && \
  chmod -R 775 /app && \
  chown -R borg:borg /config && \
  chmod -R 775 /config && \
  mkdir -p /home/borg/.ssh && \
  chown -R borg:borg /home/borg && \
  chmod -R 775 /home/borg && \
  chmod -R 777 /run

USER borg

EXPOSE 22

CMD ["/entrypoint.sh"]
