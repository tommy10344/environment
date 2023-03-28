#!/bin/sh

# 自己署名証明書作成スクリプト

echo "Generating key.pem..."
openssl genrsa -aes256 -out key.pem 4096 || result=$?
echo $result
if [ ! "$result" = "0" ]; then
  echo "Failed."
  exit
fi
echo "Succeeded."

echo "Generating csr.pem using key.pem..."
openssl req -new -sha256 -key key.pem -out csr.pem || result=$?
if [ ! "$result" = "0" ]; then
  echo "Failed."
  exit
fi
echo "Succeeded."

echo "Genarating cert.pem using csr.pem and key.pem..."
openssl x509 -req -sha256 -days 3650 -in csr.pem -signkey key.pem -out cert.pem || result=$?
if [ ! "$result" = "0" ]; then
  echo "Failed."
  exit
fi
echo "Succeeded."

echo "Generating cert.der using cert.pem..."
openssl x509 -in cert.pem -inform pem -out cert.der -outform der || result=$?
if [ ! "$result" = "0" ]; then
  echo "Failed."
  exit
fi
echo "Succeeded."
