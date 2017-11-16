FROM debian:stretch

# ENV LUAROCKS_VERSION 2.4.3
# ENV LOVE_VERSION 0.10.2

RUN apt-get update

# love2d build dependencies
RUN apt-get install -y build-essential autotools-dev automake libtool pkg-config libdevil-dev libfreetype6-dev libluajit-5.1-dev libphysfs-dev libsdl2-dev libopenal-dev libogg-dev libvorbis-dev libflac-dev libflac++-dev libmodplug-dev libmpg123-dev libmng-dev libturbojpeg0 libtheora-dev mercurial
RUN cd /tmp \
      && hg clone https://bitbucket.org/rude/love \
      && cd love \
      && ./platform/unix/automagic \
      && ./configure \
      && make \
      && make install \
      && cd / \
      && rm -r /tmp/love

ENV LUA_VERSION 5.1
RUN apt-get install -y \
      lua${LUA_VERSION}-dev \
      luarocks \
      git \
      inotify-tools \
      libyaml-dev

RUN luarocks install inotify INOTIFY_INCDIR=/usr/include/x86_64-linux-gnu \
      && luarocks install moonscript \
      && luarocks install lyaml \
      && luarocks install lualogging

RUN apt-get install -y procps
WORKDIR /usr/src/app
