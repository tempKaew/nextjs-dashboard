# Use Node.js Alpine as the Base Image to reduce the size of the Docker Image
FROM node:23.10.0-alpine AS base

# Set the Working Directory for the application inside the container
WORKDIR /app

# Install only the necessary dependencies
FROM base AS deps
# Copy only the files related to dependencies (package.json and yarn.lock)
COPY app/package.json app/yarn.lock ./

# Install dependencies based on the lockfile to ensure consistent versions
RUN yarn install --frozen-lockfile;

# Build the Next.js app for production
FROM base AS builder
# Copy dependencies from the 'deps' stage
COPY --from=deps /app/node_modules ./node_modules
# Copy the application code
COPY app ./

# Enable Standalone Mode and build the Next.js app
RUN yarn build

# Create a smaller production image
FROM node:23.10.0-alpine AS production
WORKDIR /app
# Copy only the necessary files from the build
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static
COPY --from=builder /app/public ./public

# Set the command to run the application in production
CMD ["node", "server.js"]
