FROM alpine:edge

RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing motion
COPY motion.conf /etc/motion/motion.conf

EXPOSE 8081
ENTRYPOINT ["motion"]
