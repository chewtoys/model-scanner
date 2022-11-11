#!/bin/bash 
## pass in URL as an environment variable
URL=$1

if [ -n "$URL" ]; then
    curl -s -L -o "model.bin" "$URL"

    pickescan=$(picklescan -p model.bin -l DEBUG)
    pickescanExitCode=$?

    clamscan=$(clamscan model.bin)
    clamscanExitCode=$?

    jo -p url="$URL" picklescanExitCode="$pickescanExitCode" picklescanOutput="$pickescan" clamscanExitCode="$clamscanExitCode" clamscanOutput="clamscan"
else
    echo "Missing url environment variable"
fi