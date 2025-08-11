FROM node:18-alpine

# Set working directory
WORKDIR /opt/app

# Install dependencies for building native modules
RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git

# Set environment variables
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

# Copy app source
COPY ./app .

# Install dependencies (regenerate lock file if out of sync)
RUN npm install

# Build the application
RUN npm run build

# Expose port
EXPOSE 1337

# Start the application
CMD ["npm", "run", "develop"]