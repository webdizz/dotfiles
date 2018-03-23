#!/bin/bash
# Generates SSL certificates

if [ "$1" != "" ]; then
    cert_name=$1
else
    cert_name='some.host'
fi

if [ "$2" != "" ]; then
    cert_base_path=$2
else
    cert_base_path='/tmp'
fi

echo "Cert will be installed into $cert_base_path/$cert_name.[key|crt]"

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout "$cert_base_path/$cert_name.key" -out "$cert_base_path/$cert_name.crt" \
    -subj "/C=UA/ST=Kyiv/L=Kyiv/O=$cert_name/CN=$cert_name"

openssl dhparam -out "$cert_base_path/$cert_name.dhparam.pem" 2048