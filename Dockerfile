FROM ubuntu:16.04
MAINTAINER Mike Christof <mhristof@gmail.com>

RUN apt-get update && \
  apt-get install -y \
          sudo \
          jq && \
  rm -rf /var/lib/apt/lists/*

RUN groupadd -g 999 appuser && \
    useradd -r -u 999 -g appuser appuser &&\
    adduser appuser sudo

RUN sed -i.bkp -e \
      's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' \
      /etc/sudoers

USER appuser
