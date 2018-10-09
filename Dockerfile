FROM debian

ADD https://github-mirror.open.netease.com/krallin/tini/releases/download/v0.18.0/tini-static-armhf /sbin/tini
RUN chmod +x /sbin/tini

RUN mkdir -m 0750 /root/.android
COPY files/insecure_shared_adbkey /root/.android/adbkey
COPY files/insecure_shared_adbkey.pub /root/.android/adbkey.pub

COPY adb /usr/bin/
EXPOSE 5037
ENTRYPOINT ["/sbin/tini", "--", "adb"]
CMD ["-a", "-P", "5037", "server", "nodaemon"]
