I use dorny/paths-filter@v3 to detect changes and so skip builds that are not required because there is no code change.

I break the code up to honour isolation of interests by having job workflows for the API and for the APP.

GitHub Actions plugin shows nice feedback/UI in VSCode

Branch matching DOES NOT use REGEX