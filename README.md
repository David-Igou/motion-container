![release](https://github.com/David-Igou/motion-container/workflows/release/badge.svg)

# motion-container

This repository contains Dockerfiles to run [motion](https://motion-project.github.io/) inside an Alpine container. The goal is to provide access to small containers for each release, since the official installation instructions yield 500mb+ containers. This also uses

# Deploy

I have only tested this using the Docker CLI and Kubernetes. Feel free to submit a PR for other methods.

## Docker

```
docker run -d --name=motion \
    -p 7999:7999 \
    -p 8081:8081 \
    -p 8082:8082 \
    -p 8083:8083 \
    -p 8084:8084 \
    -p 8085:8085 \
    -p 8087:8087 \
    -e TZ="America/New_York" \
    -v motion.conf:/etc/motion/motion.conf \
    -v /volume1/motion/storage:/var/lib/motion \
    -v /dev/video0:/dev/video0 \
    --restart=always \
    igou/motion:latest
```

## Kubernetes

see `kubernetes/` directory for manifests

To overwrite the default `motion.conf` you can create a configmap and mount it using `kubectl create configmap motion --from-file=motion.conf`

## Raspberry Pi

This has been tested on Raspbian and Ubuntu 20 LTS. If you are having issues, it is unlikely it comes from this container, and is probably interfacing with your boards camera.
