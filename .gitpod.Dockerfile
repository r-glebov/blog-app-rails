FROM gitpod/workspace-full

RUN cd $HOME && git clone https://github.com/neovim/neovim.git
#RUN cd $HOME/neovim && git checkout release-0.7 && make CMAKE_BUILD_TYPE=RelWithDebInfo install
RUN cd $HOME/neovim && git checkout release-0.7 && make -j4 && make CMAKE_BUILD_TYPE=Release && make install