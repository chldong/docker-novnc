# Standalone NoVNC Container

This image is intended to run a small standalone server that can target either other machines on the same network or other Docker containers.

## Configuration

Two environment variables exist in the docker file for configuration REMOTE_HOST and REMOTE_PORT.

### Variables

**REMOTE_HOST** Host running a VNC Server to connect to - defaults to *docker-ubuntu-vnc*
**REMOTE_PORT** Port that the VNC Server is listening on - defaults to *5901*

### Ports
**8081** is exposed by default.

## Usage

```
docker-compose up -d
```


