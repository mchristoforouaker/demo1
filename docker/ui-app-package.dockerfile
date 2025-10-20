FROM ui-app-build AS build

FROM --platform=linux/amd64 node:22-alpine AS package
WORKDIR /app
RUN ls -al
COPY --from=build /app/dist ./dist
