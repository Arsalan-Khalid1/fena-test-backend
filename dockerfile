# Base image
FROM node:16

# Create app directory
WORKDIR /usr/src/app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./
COPY yarn.lock ./

# Install app dependencies
RUN yarn install

# Bundle app source
COPY . .

# Expose port
EXPOSE 5000

# Creates a "dist" folder with the production build
RUN yarn run build

# Start the server using the production build
CMD [ "yarn", "start" ]
