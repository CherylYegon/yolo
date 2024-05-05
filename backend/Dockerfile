# Stage 1: Build environment
FROM node:latest AS build

# Set the working directory in the container
WORKDIR /app/backend

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose port 5000 to the outside world (optional)
EXPOSE 5000

# Command to run the application (optional)
CMD ["npm", "start"]

# Stage 2: Runtime environment
FROM node:alpine AS runtime

# Set the working directory in the container
WORKDIR /app/backend

# Copy only necessary files from the build stage
COPY --from=build /app/backend .

# Expose port 5000 to the outside world
EXPOSE 5000

# Command to run the application
CMD ["npm", "start"]
