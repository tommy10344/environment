#!/bin/sh

echo "----- CA certificate -----"
openssl genrsa -out ca.key 4096
openssl req -new -x509 -days 3650 -key ca.key -out ca.crt
openssl x509 -in ca.crt -out ca.crt.der -inform pem -outform der

echo "----- Server certificate -----"
openssl genrsa -out server.key 4096
openssl req -new -key server.key -out server.csr
openssl x509 -req -days 3650 -in server.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out server.crt

echo "----- Client certificate -----"
openssl genrsa -out client.key 4096
openssl req -new -key client.key -out client.csr
openssl x509 -req -days 3650 -in client.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out client.crt

echo "----- Client certificate to PKCS12 -----"
openssl pkcs12 -export -clcerts -in client.crt -inkey client.key -out client.p12
