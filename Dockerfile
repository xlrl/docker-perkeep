FROM library/alpine:3.12 AS builder
LABEL maintainer="<XelaRellum@web.de"

RUN set -xe \
    apk update && apk upgrade && \
    apk add --no-cache --virtual=run-deps \
    curl git go

# 2020-07-1 @7321b90
ENV COMMIT=7321b90b6e112e7847cb6f3f9683c74d545d5059
ENV GOPATH=/go
WORKDIR /src

RUN git clone https://github.com/perkeep/perkeep.git

WORKDIR /src/perkeep

RUN git checkout $COMMIT && \
    go run make.go

FROM library/alpine:3.12

EXPOSE 3179

COPY --from=builder /go/bin/* /usr/local/bin/

ENTRYPOINT ["perkeepd"]
