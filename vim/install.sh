#!/usr/bin/env bash

# Information
# ------------------------------------------------------------------------------
printf "# --------------------\n"
printf "# Vim Installation\n"
printf "# --------------------\n"

# Set the directory to the directory where the script is
# ------------------------------------------------------------------------------
DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if the required files are already in place and, if so, ask if we should
# remove them
# ------------------------------------------------------------------------------
CONTINUE=true
if [ -e ~/.vimrc ] || [ -e ~/.gvimrc ] || [ -d ~/.vim ]; then
    printf "Some files would be overwritten installing Vim config. Continue? (y/N): "
    read -r RESPONSE
    case $RESPONSE in
        [yY])
            printf "Removing ~/.vimrc... "
            rm ~/.vimrc
            printf "Done\n"
            printf "Removing ~/.gvimrc... "
            rm ~/.gvimrc
            printf "Done\n"
            printf "Removing ~/.vim... "
            rm -fr ~/.vim
            printf "Done\n"
            ;;
        *)
            CONTINUE=false
            ;;
    esac
fi

if ! $CONTINUE; then
    printf "Nothing installed\n\n"
    exit 0
fi

# Copy the required setup files
# ------------------------------------------------------------------------------
cp $DIRECTORY/vimrc ~/.vimrc
cp $DIRECTORY/gvimrc ~/.gvimrc
cp -R $DIRECTORY/vim ~/.vim

# Install Vundle
# ------------------------------------------------------------------------------
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install Vundle plugins
# ------------------------------------------------------------------------------
vim +PluginInstall +qall

# Success message
# ------------------------------------------------------------------------------
printf "\nVim settings successfully installed\n\n"

