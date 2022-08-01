FROM gitpod/workspace-full

# Install Rails
RUN gem install rails webdrivers 

# Install solargraph
RUN gem install solargraph

RUN cd $HOME && git clone https://github.com/neovim/neovim.git
RUN cd $HOME/neovim && git checkout release-0.7 && make CMAKE_BUILD_TYPE=RelWithDebInfo install
