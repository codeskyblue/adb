# adb Dockerfile for Linux(amd64 and armv7l)

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
On linux amd64
```bash
docker build -t adb .
docker tag adb codeskyblue/adb:latest
docker push codeskyblue/adb:latest
```

On linux armv7l(raspberry)
```bash
docker build -t adb -f Dockerfile.armv7l .
docker tag adb codeskyblue/adb:armv7l-latest
docker push codeskyblue/adb:armv7l-latest
```

Push manifest
```bash
TAG=codeskyblue/adb:latest
docker manifest create $TAG codeskyblue/adb:latest codeskyblue/adb:armv7l-latest
docker manifest annotate $TAG codeskyblue/adb:latest --os linux --arch amd64
docker manifest annotate $TAG codeskyblue/adb:armv7l-latest --os linux --arch arm --variant v7
docker manifest push $TAG
# check
docker run --rm mplatform/mquery $TAG
```

## Thanks
- [sorccu](https://github.com/sorccu)
- <https://github.com/qhuyduong/arm_adb>

## LICENSE
[Apache v2](LICENSE)
