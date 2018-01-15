#!/bin/sh
# Install SDKs maintained by sdkman

source ~/.sdkman/bin/sdkman-init.sh

for ext in 'java 8u151-oracle' \
                'java 9.0.1-oracle' \
                'gradle 4.4.1' \
                'kotlin 1.2.10' \
                ; do
    sdk install $ext
done