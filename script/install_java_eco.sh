#!/bin/bash
# Install SDKs maintained by sdkman

. ~/.sdkman/bin/sdkman-init.sh

for ext in 'java' \
           'gradle' \
           'kotlin' \
           ; do
    sdk install $ext
done
