# Stage 1: dependency
FROM node:20-alpine AS dependency
WORKDIR /app
COPY package*.json ./
RUN npm install


# Stage 2: development
FROM dependency AS development
COPY . .
EXPOSE 3000
CMD ["npm", "run", "dev"]


# Stage 3: builder
FROM dependency AS builder
COPY . .
RUN npm run build

# Stage 4: production
FROM nginx:alpine3.21-slim AS production
WORKDIR /usr/share/nginx/html
COPY --from=builder /app/build .
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]
