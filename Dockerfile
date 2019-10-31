FROM debian

ADD https://launcher.mojang.com/download/Minecraft.deb /Minecraft.deb
RUN apt-get update
RUN apt install -y /Minecraft.deb

USER 1000:1000

ADD pulseaudio.client.conf /etc/pulse/client.conf
ENV PULSE_SERVER unix:/tmp/pulseaudio.socket
ENV PULSE_COOKIE /tmp/pulseaudio.cookie

CMD minecraft-launcher
