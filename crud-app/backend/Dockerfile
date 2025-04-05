FROM node:16-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json ./

# Install dependencies
RUN npm install
COPY . .
EXPOSE 3700

CMD [ "npm" ,"run" ,"start:dev"]