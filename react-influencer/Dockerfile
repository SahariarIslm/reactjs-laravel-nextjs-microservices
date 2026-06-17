FROM node:20-alpine AS build
WORKDIR /app
COPY . .
RUN npm ci && npm run build

FROM nginx:alpine
# CRA outputs to /build, not /dist
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80