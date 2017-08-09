#!/usr/bin/env bash

# Information
# ------------------------------------------------------------------------------
printf "# -----------------------\n"
printf "# phpcsfixer installation\n"
printf "# -----------------------\n"

# Set the directory to the directory where the script is
# ------------------------------------------------------------------------------
DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if the required files are already in place and, if so, ask if we should
# remove them
# ------------------------------------------------------------------------------
CONTINUE=true
if [ -e ~/.phpcsfixer ]; then
    printf "Some files would be overwritten installing PHPCSFixer config. Continue? (y/N): "
    read -r RESPONSE
    case $RESPONSE in
        [yY])
            printf "Removing ~/.phpcsfixer... "
            rm ~/.phpcsfixer
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
cp $DIRECTORY/phpcsfixer ~/.phpcsfixer

# Success message
# ------------------------------------------------------------------------------
printf "\nPHPCSFixer config installed\n\n"

