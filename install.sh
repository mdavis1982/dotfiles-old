#!/usr/bin/env bash

# Information
# ------------------------------------------------------------------------------
printf "# ---------------------\n"
printf "# dotfiles Installation\n"
printf "# ---------------------\n\n"
printf "This script will install dotfiles to set up or upgrade a macOS system.\n\n"

# Set the directory to the directory where the script is
# ------------------------------------------------------------------------------
BASE_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install each section in turn
# ------------------------------------------------------------------------------
source $BASE_DIRECTORY/oh-my-zsh/install.sh
source $BASE_DIRECTORY/dnsmasq/install.sh
source $BASE_DIRECTORY/vim/install.sh
source $BASE_DIRECTORY/git/install.sh
source $BASE_DIRECTORY/wget/install.sh
source $BASE_DIRECTORY/phpcsfixer/install.sh
