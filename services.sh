#!/bin/bash

# Check if at least one argument is provided
if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <service1> [<service2> ...]"
  echo "Example: $0 pr1 pr2"
  exit 1SERVICE
fi

# Construct the configuration JSON
configFile="config.json"
echo "{
  \"services\": ["$(printf '"%s",' "$@" | sed 's/,$//')"]
}" >$configFile

# Start the Node.js server
./test.sh
