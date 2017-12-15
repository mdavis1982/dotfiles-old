# Add some directories to the path:
# ---------------------------------
# - Some Homebrew formulae put executables into /usr/local/sbin
# - Global composer tools are installed into $HOME/.composer/vendor/bin

export PATH="./vendor/bin:$HOME/.composer/vendor/bin:/usr/local/sbin:$PATH"

