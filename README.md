# docker-perkeep

This is a docker image for [perkeep](https://perkeep.org/).

This image is based on Alpine Linux und thus pretty small (~260MiB).

## Usage

Use this image like this (we suppose the directory `foo`):

```yaml
version: "3"
services:
    server:
        image: xlrl/perkeep:latest
        ports:
            - "3179"
        volumes:
            - ./conf:/root/.config/perkeep
            - ./data:/root/var/perkeep
        restart: always
```

You can then start the server for the first time:

```shell
docker-compose up
```

This will generate a default configuration in `conf`.

For configuration options, see [Perkeep Docs](https://perkeep.org/doc/server-config).

## License

This image is licensed under the MIT License, see [LICENSE].
