#!/bin/bash

# Read services from config.json
SERVICES_JSON=$(cat config.json)

# Extract the services array manually using grep and sed
SERVICES=$(echo "$SERVICES_JSON" | grep -o '"services":\s*\[[^]]*\]' | sed 's/.*\[\([^]]*\)\].*/\1/' | tr -d '[]" ' | tr ',' '\n')
echo "SERVICES :::: $SERVICES"
# Start the Dockerfile
cat <<EOF >Dockerfile
# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory inside the Docker container
WORKDIR /

# Copy common files
COPY package.json yarn.lock server.js config.json ./
RUN yarn install

# Conditionally copy the specified services
EOF

# Loop through the extracted services and add COPY commands to Dockerfile
for SERVICE in $SERVICES; do
    echo "COPY services/${SERVICE} /services/${SERVICE}" >>Dockerfile
done

# Set the entrypoint
echo 'CMD ["node", "server.js"]' >>Dockerfile

echo "Dockerfile has been generated successfully."
