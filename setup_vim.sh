#!/bin/bash

# Real simple script that'll do it all without any questions as to 
# what you do and don't want cause it doesn't care.

mkdir ./vim && mkdir ./vim/autoload
mkdir ./vim/bundle && mkdir ./vim/colors
root_dir=$PWD

if git --version 2>/dev/null; then
    ##########################################
    # Pathogen stuff
    ##########################################
    curl -LSso ./vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

    ##########################################
    # Color Scheme Shit
    ##########################################
    cd vim/bundle/
    git clone https://github.com/sonph/onehalf
    cp onehalf/vim/colors/onehalfdark.vim ../colors/

    ##########################################
    # Complete Me has compiled sections so I'll do this
    ##########################################
    git clone https://github.com/Valloric/YouCompleteMe
    cd ./YouCompleteMe
    git submodule update --init --recursive
    ./install.py --all

    ##########################################
    # Do the rest
    ##########################################
    cd $root_dir/vim/bundle

    git clone https://github.com/scrooloose/nerdtree
    git clone https://github.com/scrooloose/nerdcommenter
    git clone https://github.com/w0rp/ale

    cd $root_dir

    printf "\nBe sure to compile vim from source and then build YouCompleteMe\n"
    printf "Also, I think w0rp/ale has some additional setup as well\n"
    printf "\nMoving vim/ to .vim and vimrc to .vimrc..."

    rm -rf $HOME/.vim
    rm $HOME/.vimrc
    cp ./vimrc $HOME/.vimrc
    mkdir $HOME/.vim && mv ./vim/* $HOME/.vim/
    rmdir ./vim

    echo "Should be good now..."
    echo "If YouCompleteMe fails, you most likely need to install vim from source..."
else
    echo "Install git dude"
fi
