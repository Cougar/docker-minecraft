FROM debian

ADD https://launcher.mojang.com/download/Minecraft.deb /Minecraft.deb
RUN apt-get update
RUN apt install -y /Minecraft.deb

USER 1000:1000

CMD minecraft-launcher
