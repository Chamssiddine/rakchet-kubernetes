# Base image
FROM node:18-alpine 

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./
# Install dependencies

RUN npm install

COPY . .
RUN npm run generate
RUN npm install @peculiar/webcrypto
RUN npm install prisma -g
RUN npx prisma generate


EXPOSE 3001

# Start the app with nodemon (for dev; switch to `node` for production)
# CMD ["npx", "nodemon", "src/server.js"]
CMD ["sleep","1000"]
# CMD ["node", "src/server.js"]
