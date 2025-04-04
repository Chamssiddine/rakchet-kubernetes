# Base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app
COPY . .

EXPOSE 3100

# Start the app with nodemon (for dev; switch to `node` for production)
# CMD ["npx", "nodemon", "src/server.js"]
CMD ["node", "src/server.js"]
