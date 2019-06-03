#!/usr/bin/env bash

# Information
# ------------------------------------------------------------------------------
printf "# ------------------\n"
printf "# Lambo Installation\n"
printf "# ------------------\n"

# Set the directory to the directory where the script is
# ------------------------------------------------------------------------------
DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if the required files are already in place and, if so, ask if we should
# remove them
# ------------------------------------------------------------------------------
CONTINUE=true
if [ -d ~/.lambo ] ; then
    printf "Lambo configuration would be overwritten installing new Lambo config. Continue? (y/N): "
    read -r RESPONSE
    case $RESPONSE in
        [yY])
            printf "Removing ~/.lambo... "
            rm -fr ~/.lambo
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

# Copy configuration files
# ------------------------------------------------------------------------------
cp -R $DIRECTORY ~/.lambo
rm ~/.lambo/install.sh

# Success message
# ------------------------------------------------------------------------------
printf "\nLambo configuration successfully installed\n\n"
