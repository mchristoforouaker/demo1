FROM ui-app-package AS package

FROM node:22-alpine AS runtime
WORKDIR /app
COPY --from=package /app .
RUN ls -al
# Need to do this every time we use npm in a new image.
RUN npm config set strict-ssl false
RUN npm i -g serve

ENTRYPOINT ["serve", "-s",  "./dist", "-l", "5173"]