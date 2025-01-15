# Arena Facil Services

Este projeto é uma aplicação Quarkus que fornece serviços de backend para o Arena Facil.

### Executando a aplicação em modo de desenvolvimento

Você pode executar sua aplicação em modo de desenvolvimento, que permite live coding, usando:

```shell script
./mvnw compile quarkus:dev

```shell script
./mvnw compile quarkus:dev
```

> **_NOTA:_** A Url local: <http://localhost:8084/arena-facil-services/api>.



## Autenticação com Keycloak

A aplicação utiliza Keycloak para autenticação. As configurações do Keycloak podem ser encontradas no
arquivo `application.properties`. Certifique-se de configurar corretamente
o `client-id`, `auth-server-url` e outras propriedades relacionadas ao Keycloak.

## Documentação da API com Swagger

A documentação da API é gerada automaticamente pelo Swagger e pode ser acessada em `/arena-facil-services/docs`
quando a aplicação estiver em execução. Isso permite que você visualize e teste os endpoints da API de forma interativa.
