#!/bin/bash
#
echo > outputFile.txt
for hostname in $(cat hostnameList.txt)
do
        echo "Testing hostname: $hostname" >> outputFile.txt
        echo >> outputFile.txt
        docker run --rm -t milobahg/sslscan --no-cipher-details --no-renegotiation --no-compression --no-fallback --no-hearbleed --no-colour --tlsall $hostname | grep TLSv1 >> outputFile.txt
        echo >> outputFile.txt
        echo >> outputFile.txt
done
