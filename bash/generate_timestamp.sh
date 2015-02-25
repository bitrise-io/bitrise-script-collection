#!/bin/bash

# exit if a command fails
set -e


function getCurrentUnixTimestamp {
	printf %s $(date +%s)
}
 
echo "==> Generating current timestamp..."
current_unix_timestamp=$(getCurrentUnixTimestamp)
echo " * Generated Timestamp: ${current_unix_timestamp}"


echo
echo "==> Finished with success"
echo