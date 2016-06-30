#!/usr/bin/env bash

# Information
# ------------------------------------------------------------------------------
printf "# --------------------\n"
printf "# wget installation\n"
printf "# --------------------\n"

# Set the directory to the directory where the script is
# ------------------------------------------------------------------------------
DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if the required files are already in place and, if so, ask if we should
# remove them
# ------------------------------------------------------------------------------
CONTINUE=true
if [ -e ~/.wgetrc ]; then
    printf "Some files would be overwritten installing Git config. Continue? (y/N): "
    read -r RESPONSE
    case $RESPONSE in
        [yY])
            printf "Removing ~/.wgetrc... "
            rm ~/.wgetrc
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

# Copy the required files
# ------------------------------------------------------------------------------
cp $DIRECTORY/wgetrc ~/.wgetrc

# Success message
# ------------------------------------------------------------------------------
printf "\nwget config installed\n\n"

