
BUILD
docker build --progress plain --no-cache -t ui-app-build -f ui-app-build.dockerfile ../ui/vite-ui-app

PACKAGE
docker build --progress plain --no-cache -t ui-app-package -f ui-app-package.dockerfile ../ui/vite-ui-app

RUN
