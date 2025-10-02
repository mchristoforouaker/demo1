FROM ui-app-build AS build

FROM node:22-alpine AS package
WORKDIR /app
RUN ls -al
COPY --from=build /app/dist ./dist
