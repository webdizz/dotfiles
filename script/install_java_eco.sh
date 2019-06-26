#!/bin/bash
# Install SDKs maintained by sdkman

. ~/.sdkman/bin/sdkman-init.sh

for ext in 'java 8.0.212-amzn' \
           'gradle 5.5-rc-4' \
           'kotlin 1.3.40' \
           ; do
    sdk install $ext
done
