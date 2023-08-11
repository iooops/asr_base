
FROM --platform=linux/amd64 ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
	# apt-get install -y --no-install-recommends python3-pip python3-setuptools python3-dev \
	apt-get install -y --no-install-recommends python3-pip python3-setuptools python3-dev locales \
	&& apt-get -y autoremove && rm -rf /var/lib/apt/lists/*
	
RUN locale-gen zh_CN.UTF-8  
ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8

COPY ./requirements.txt /requirements.txt
RUN python3 -m pip install --upgrade pip setuptools && pip3 install --no-cache-dir -r requirements.txt
