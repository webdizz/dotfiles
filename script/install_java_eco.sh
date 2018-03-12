#!/bin/bash
# Install SDKs maintained by sdkman

. ~/.sdkman/bin/sdkman-init.sh

for ext in 'java 8u161-oracle' \
           'java 9.0.4-oracle' \
           'gradle 4.6' \
           'kotlin 1.2.30' \
           ; do
    sdk install $ext
done
