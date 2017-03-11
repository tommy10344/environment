#!/bin/sh

# 自己署名証明書作成スクリプト

openssl genrsa -aes256 -out key.pem 4096
openssl req -new -sha256 -key key.pem -out csr.pem
openssl x509 -req -sha256 -days 3650 -in csr.pem -signkey key.pem -out cert.pem
openssl x509 -in cert.pem -inform pem -out cert.der -outform der
