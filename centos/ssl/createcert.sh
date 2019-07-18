#!/bin/bash

# generate a key for localhost
openssl genrsa -out localhost.key 4096 &&

# generate a key for localhost
openssl req -new -sha256 \
    -out localhost.csr \
    -key localhost.key \
    -config localhost.conf \
    -subj "/C=CA/ST=Ontario/L=Ottawa/O=Carleton University/CN=carleton.ca" &&

openssl x509 -req \
    -sha256 \
    -days 3650 \
    -in localhost.csr \
    -signkey localhost.key \
    -out localhost.crt \
    -extensions req_ext \
    -extfile localhost.conf &&

sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain localhost.crt