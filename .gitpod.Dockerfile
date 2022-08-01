FROM gitpod/workspace-full


RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config

RUN cd $HOME && git clone https://github.com/neovim/neovim.git
#RUN cd $HOME/neovim && git checkout release-0.7 && make CMAKE_BUILD_TYPE=RelWithDebInfo install
RUN cd $HOME/neovim && git checkout release-0.7 && make -j4 && make CMAKE_BUILD_TYPE=Release && make install