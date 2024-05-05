# Stage 1: Build environment
FROM node:alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .
RUN npm run build

# Stage 2: Runtime environment
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
