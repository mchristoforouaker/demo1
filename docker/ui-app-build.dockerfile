FROM node:22-alpine AS build

WORKDIR /app
# NOTE: Context is ../ui/vite-ui-app
COPY . .
# RUN ls -al
RUN npm config set strict-ssl false
RUN npm install && \
    npm run build
