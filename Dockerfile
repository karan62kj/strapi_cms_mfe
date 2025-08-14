FROM node:18-alpine

# Installing libvips-dev for sharp Compatibility
RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git

# Set working directory
WORKDIR /opt/

# Copy package files
COPY ./app/package*.json ./
RUN npm install

# Set working directory to app
WORKDIR /opt/app

# Copy app source code
COPY ./app/ .

# Build admin
RUN npm run build

# Expose port
EXPOSE 1337

# Start the application
CMD ["npm", "run", "develop"]