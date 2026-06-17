FROM node:20-alpine AS build
WORKDIR /app
ARG REACT_APP_API_URL=http://localhost:8000/api/admin
ENV REACT_APP_API_URL=$REACT_APP_API_URL
COPY . .
RUN npm install --legacy-peer-deps && npm run build

# --- SECOND STAGE ---
FROM node:20-alpine
WORKDIR /app

# Install the lightweight static file server globally
RUN npm install -g serve

# ONLY copy the final built assets from the build stage
COPY --from=build /app/build ./build

EXPOSE 3000

# Serve the build directory on port 3000
CMD ["serve", "-s", "build", "-l", "3000"]
