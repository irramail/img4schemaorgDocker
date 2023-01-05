FROM ubuntu

RUN apt-get update && apt-get install -y \
	nginx \
	redis-server \
	imagemagick \
	default-jdk \
	scala \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /root

COPY . .
COPY ./amm /usr/local/bin/amm
CMD ["./run.sh"]
