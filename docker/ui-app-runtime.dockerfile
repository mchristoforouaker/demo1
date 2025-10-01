FROM ui-app-package AS package
WORKDIR /app
COPY --from=package /app .
RUN ls -al
# Need to do this every time we use npm in a new image.
RUN npm config set strict-ssl false
RUN npm i -g serve

ENTRYPOINT ["serve", "-s",  "./dist", "-l", "5173"]