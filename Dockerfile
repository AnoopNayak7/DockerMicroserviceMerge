# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory inside the Docker container
WORKDIR /

# Copy common files
COPY package.json yarn.lock server.js config.json ./
RUN yarn install

# Conditionally copy the specified services
COPY services/pr2 /services/pr2
COPY services/pr4 /services/pr4
CMD ["node", "server.js"]
