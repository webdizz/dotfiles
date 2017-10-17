#!/bin/sh
# Install SDKs maintained by sdkman

source ~/.sdkman/bin/sdkman-init.sh

for ext in 'java 8u144-oracle' \
            'gradle 4.2.1'; do
    sdk install $ext
done