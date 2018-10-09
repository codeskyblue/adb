# adb Dockerfile for Linux armv7l

## Usage
- The container needs extended privileges for USB access
- The host's /dev/bus/usb must be mounted on the container

This usage pattern shares the ADB server container's network with ADB client containers.

Start the server:
```bash
docker run -d --privileged -v /dev/bus/usb:/dev/bus/usb --name adbd codeskyblue/adb
```

Then on the same machine:
```bash
docker run --rm -ti --net container:adbd codeskyblue/adb devices
```

More usage reference
<https://github.com/sorccu/docker-adb>

## Build
```bash
docker build -t adb .
docker tag adb codeskyblue/adb:1.0.39
docker tag adb codeskyblue/adb:latest
docker push codeskyblue/adb
```

## Thanks
- [sorccu](https://github.com/sorccu)
- <https://github.com/qhuyduong/arm_adb>

## LICENSE
[Apache v2](LICENSE)
