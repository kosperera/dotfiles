#!/usr/bin/env zsh

# First, make sure to install Sdkman from https://sdkman.io/install

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

echo "sdk version: $(sdk version)"

# Install some sdks.

# https://sdkman.io/jdks#ms
sdk install java 21-ms

echo "java --version: $(java --version)"
echo "which java version: $(which java)"