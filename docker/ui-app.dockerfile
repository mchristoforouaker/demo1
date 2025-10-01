FROM node:22-alpine AS build

WORKDIR /app
# NOTE: Context is ../ui/vite-ui-app
COPY . .
RUN ls -al
RUN npm config set strict-ssl false
RUN npm install && \
    npm run build

FROM node:22-alpine AS package

WORKDIR /app
RUN ls -al
COPY --from=build /app/dist ./dist

FROM node:22-alpine AS runtime
WORKDIR /app
COPY --from=package /app .
RUN ls -al
# Need to do this every time we use npm in a new image.
RUN npm config set strict-ssl false
RUN npm i -g serve

ENTRYPOINT ["serve", "-s",  "./dist", "-l", "5173"]
