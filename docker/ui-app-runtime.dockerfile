FROM ui-app-package AS package

FROM --platform=linux/amd64 node:22-alpine AS runtime
WORKDIR /app
COPY --from=package /app .
RUN ls -al
# Need to do this every time we use npm in a new image.
RUN npm config set strict-ssl false
RUN npm i -g serve

RUN ls -al

#ENTRYPOINT ["serve", "-s",  "./dist", "-l", "5173"]
ENTRYPOINT ["ls", "-al"]