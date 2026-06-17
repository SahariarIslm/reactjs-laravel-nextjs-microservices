FROM node:20-alpine
WORKDIR /app

# Accept build arguments for API configuration
ARG NEXT_PUBLIC_API_URL=http://localhost:8000/api/checkout
ARG NEXT_PUBLIC_STRIPE_KEY=pk_test_51TgfwzCxnrjNjmoRhIJFaovmoNhNmwMxAlS36KTIUjocg3qrPb4TNfeR2GMvdnhX3HmORpOfQO4VHm09Lbg10L3300P2zuto0f

# Set environment variables for build
ENV NEXT_PUBLIC_API_URL=$NEXT_PUBLIC_API_URL
ENV NEXT_PUBLIC_STRIPE_KEY=$NEXT_PUBLIC_STRIPE_KEY

COPY . .
RUN npm ci && npm run build
EXPOSE 3000
CMD ["npm", "start"]