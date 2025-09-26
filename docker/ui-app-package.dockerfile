FROM ui-app-build AS build

WORKDIR /app
RUN ls -al
COPY --from=build /app/dist ./dist
