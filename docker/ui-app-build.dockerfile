FROM node:22-alpine

WORKDIR /app
#COPY ../ui/vite-ui-app/ ./dist
COPY . .
RUN ls -al
RUN npm config set strict-ssl false
RUN npm install && \
    npm run build
#COPY ./dist ./dist
#COPY ./package.json .
