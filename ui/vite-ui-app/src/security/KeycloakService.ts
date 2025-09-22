import Keycloak from "keycloak-js";

// TODO get this from local env or config file
const keycloakInstance = new Keycloak(
    {
    "realm": "MyRealm",
//    "url": "http://keycloak:8080/",
    "url": "http://localhost:8080/",
//    "ssl-required": "external",
    "clientId": "MyClient",
//    "public-client": true,
//    "confidential-port": 0
    }
);

/**
 * Initializes Keycloak instance and calls the provided callback function if successfully authenticated.
 *
 * @param onAuthenticatedCallback
 */
/* eslint-disable @typescript-eslint/no-explicit-any */
const Login = (onAuthenticatedCallback: () => any) => {
  keycloakInstance
    .init({ onLoad: "login-required", 
            pkceMethod: 'S256' })
    .then(function (authenticated) {
        return (authenticated ? onAuthenticatedCallback() : alert("non authenticated"));
    })
    .catch((e) => {
      console.dir(e);
      console.log(`keycloak init exception: ${e}`);
    });
};


const UserName = () => keycloakInstance.tokenParsed?.preferred_username;

const KeyCloakService = {
  CallLogin: Login,
  GetUserName: UserName
};

export default KeyCloakService;