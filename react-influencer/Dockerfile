FROM node:20-alpine AS build
WORKDIR /app

# Accept build arguments for API configuration
ARG REACT_APP_API_URL=http://localhost:8000/api/influencer
ARG REACT_APP_CHECKOUT_URL=http://localhost:3002

# Set environment variables for build
ENV REACT_APP_API_URL=$REACT_APP_API_URL
ENV REACT_APP_CHECKOUT_URL=$REACT_APP_CHECKOUT_URL

COPY . .
RUN npm ci && npm run build

FROM nginx:alpine
# CRA outputs to /build, not /dist
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80