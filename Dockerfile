FROM debian

RUN mkdir -m 0750 /root/.android
COPY files/insecure_shared_adbkey /root/.android/adbkey
COPY files/insecure_shared_adbkey.pub /root/.android/adbkey.pub

ADD https://github-mirror.open.netease.com/krallin/tini/releases/download/v0.18.0/tini-static /sbin/tini
RUN chmod +x /sbin/tini
COPY files/linux-amd64/adb /usr/bin/

ENV ANDROID_ADB_SERVER_PORT 5037
EXPOSE 5037

ENTRYPOINT ["/sbin/tini", "--", "adb"]
CMD ["-a", "server", "nodaemon"]
