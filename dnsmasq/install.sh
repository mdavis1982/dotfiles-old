#!/usr/bin/env bash

# Information
# ------------------------------------------------------------------------------
printf "# --------------------\n"
printf "# dnsmasq Installation\n"
printf "# --------------------\n"

# Set the directory to the directory where the script is
# ------------------------------------------------------------------------------
DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if dnsmasq has been installed with Homebrew
# ------------------------------------------------------------------------------
if ! [ -d /usr/local/Cellar/dnsmasq ]; then
    printf "dnsmasq has not been installed. Run:\n\n"
    printf "brew install dnsmasq\n\n"
    printf "before attempting to set up configuration\n"

    exit 0
fi

# Check if the required files are already in place and, if so, ask if we should
# remove them
# ------------------------------------------------------------------------------
CONTINUE=true
if [ -e /usr/local/etc/dnsmasq.conf ]; then
    printf "Some files would be overwritten installing dnsmasq config. Continue? (y/N): "
    read -r RESPONSE
    case $RESPONSE in
        [yY])
            printf "Removing /usr/local/etc/dnsmasq.conf... "
            rm /usr/local/etc/dnsmasq.conf
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

# Copy example configuration file
# ------------------------------------------------------------------------------
cp /usr/local/opt/dnsmasq/dnsmasq.conf.example /usr/local/etc/dnsmasq.conf

# Insert config line to bottom of dnsmasq.conf
# ------------------------------------------------------------------------------
echo "conf-file=$DIRECTORY/dnsmasq.conf" >> /usr/local/etc/dnsmasq.conf

# Create domain resolver
# ------------------------------------------------------------------------------
if ! [ -d /etc/resolver ]; then
    printf "Creating resolver directory (requires password)\n"
    sudo mkdir /etc/resolver
fi

if [ -e /etc/resolver/test ]; then
    printf "Domain resolver already exists... Removing (requires password)\n"
    sudo rm /etc/resolver/test
fi

printf "Creating domain resolver (requires password)\n"
sudo touch /etc/resolver/test
echo "nameserver 127.0.0.1" | sudo tee -a /etc/resolver/test > /dev/null

# Restart dnsmasq
# ------------------------------------------------------------------------------
printf "Restarting dnsmasq (requires password)\n"
sudo brew services restart dnsmasq

# Success message
# ------------------------------------------------------------------------------
printf "\ndnsmasq settings successfully installed\n\n"

