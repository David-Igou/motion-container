FROM alpine:latest

RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing motion=4.3.2-r0
COPY motion.conf /etc/motion/motion.conf

EXPOSE 8081
ENTRYPOINT ["motion"]

