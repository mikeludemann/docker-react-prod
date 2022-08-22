FROM node:alpine AS production

ENV NODE_ENV production

# Add a work directory
WORKDIR /app

# Cache dependencies
COPY package*.json .
COPY yarn.lock .

# Install dependencies
RUN yarn install

# Copy app files
COPY . .

# Build the application
RUN yarn build

# Start the app
CMD [ "sudo", "service", "apache2", "restart" ]
