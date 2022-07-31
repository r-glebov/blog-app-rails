# [Choice] Ruby version (use -bullseye variants on local arm64/Apple Silicon): 3, 3.1, 3.0, 2, 2.7, 2.6, 3-bullseye, 3.1-bullseye, 3.0-bullseye, 2-bullseye, 2.7-bullseye, 2.6-bullseye, 3-buster, 3.1-buster, 3.0-buster, 2-buster, 2.7-buster, 2.6-buster
ARG VARIANT=3.1-bullseye
FROM mcr.microsoft.com/vscode/devcontainers/ruby:0-${VARIANT}

# Install Rails
RUN gem install rails webdrivers 

# Default value to allow debug server to serve content over GitHub Codespace's port forwarding service
# The value is a comma-separated list of allowed domains 
ENV RAILS_DEVELOPMENT_HOSTS=".githubpreview.dev"
 
# [Choice] Node.js version: lts/*, 16, 14, 12, 10
ARG NODE_VERSION="lts/*"
RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends git ripgrep python3 python3-pip nodejs ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config zip unzip

############################### neovim, plugged, coc ##########################

#RUN         wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -O /opt/nvim
#RUN         chmod +x /opt/nvim
#ENV         APPIMAGE_EXTRACT_AND_RUN 1
#RUN         mkdir -p /vscode/.config/nvim/plugged
#RUN         curl -fLo ~/.local/share/nvim/site/autoload/plug.vim \
#                 --create-dirs \
#                 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#RUN sudo ln -s /opt/nvim /usr/bin/nvim

RUN cd /home/vscode && git clone https://github.com/neovim/neovim.git
RUN cd /home/vscode/neovim && git checkout release-0.7 && make CMAKE_BUILD_TYPE=RelWithDebInfo install

RUN mkdir -p /home/vscode/.config/nvim && git clone https://github.com/LunarVim/nvim-basic-ide.git /home/vscode/.config/nvim && chown -R vscode:vscode /home/vscode/.config/nvim

WORKDIR /workspaces/blog-app-rails

RUN gem install solargraph

RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'silent PackerSync'

RUN nvim --headless -c 'set cmdheight=50' -c 'silent TSInstallSync all' -c 'sleep 20' -c 'qall'

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1
