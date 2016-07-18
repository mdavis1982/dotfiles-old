#!/usr/bin/env bash

# Information
# ------------------------------------------------------------------------------
printf "# -----------------------\n"
printf "# Oh My ZSH! Installation\n"
printf "# -----------------------\n"

# Set the directory to the directory where the script is
# ------------------------------------------------------------------------------
DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if ~/.oh-my-zsh exists
# ------------------------------------------------------------------------------
if ! [ -d ~/.oh-my-zsh ]; then
    printf "Oh My ZSH! has not been installed.\n"

    exit 0
fi

# Check if the required files are already in place and, if so, ask if we should
# remove them
# ------------------------------------------------------------------------------
CONTINUE=true
if [ -e ~/.oh-my-zsh/custom/paths.zsh ]; then
    printf "Some files would be overwritten installing Oh My ZSH! config. Continue? (y/N): "
    read -r RESPONSE
    case $RESPONSE in
        [yY])
            printf "Removing ~/.oh-my-zsh/custom/paths.zsh... "
            rm ~/.oh-my-zsh/custom/paths.zsh
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

# Copy configuration file
# ------------------------------------------------------------------------------
cp $DIRECTORY/custom/paths.zsh ~/.oh-my-zsh/custom/paths.zsh

# Success message
# ------------------------------------------------------------------------------
printf "\nOh My ZSH! settings successfully installed\n\n"

