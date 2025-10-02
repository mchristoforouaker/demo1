
## Using one dockerfile (ui-app)

Use from this directory
BUILD

```sh
docker build --progress plain --no-cache -t ui-app-runtime -f ui-app.dockerfile ../ui/vite-ui-app
```

RUN

```sh
docker run -p5173:5173 ui-app-runtime
```

Then go to http://localhost:5173

NOTE: Keycloak needs to be running then you will see the keycloak login also postgres. See the compose directory 

## Using multiple dockerfiles (i.e. separate steps)

## Pushing to github registry

```sh
docker login ghcr.io -u ${{ secrets.DOCKERHUB_USERNAME }} --password-stdin

docker image tag ui-app-runtime:latest ghcr.io/mchristoforouaker/ui-app-runtime:1.0

docker push ghcr.io/mchristoforouaker/ui-app-runtime:1.0
```

