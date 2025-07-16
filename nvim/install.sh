#!/bin/bash

git clone https://github.com/neovim/neovim && \
    cd neovim && \
    git checkout stable && \
    make CMAKE_BUILD_TYPE=RelWithDebInfo && \
    sudo make install && \
    cd .. && \
    rm -rf neovim
echo done! Installed nvim
