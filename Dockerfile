FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y -qq --no-install-recommends \
               ca-certificates \
               git \
               openssh-client \
    && apt-get clean \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /tmp/* /var/tmp/* \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -ms /bin/bash gituser \
    && mkdir -p /workspace \
    && chown gituser:gituser /workspace

USER gituser
WORKDIR /workspace
ADD ./git-credentials.sh /git-credentials.sh
ADD ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
