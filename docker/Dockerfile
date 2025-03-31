FROM node:23.10.0-alpine AS base

# Set working directory
WORKDIR /app

# Install dependencies only when needed
FROM base AS deps
# Copy package.json and lockfile(s)
COPY /app/package.json /app/yarn.lock ./
# Install dependencies based on the lockfile
RUN \
  if [ -f yarn.lock ]; then yarn --frozen-lockfile; \
  elif [ -f package-lock.json ]; then npm ci; \
  elif [ -f pnpm-lock.yaml ]; then corepack enable pnpm && pnpm i --frozen-lockfile; \
  else echo "Lockfile not found." && exit 1; \
  fi

# Development image
FROM base AS builder
# Copy installed modules from the deps stage
COPY --from=deps /app/node_modules ./node_modules
# Copy application source code
COPY . .
# Start the development server
CMD yarn dev