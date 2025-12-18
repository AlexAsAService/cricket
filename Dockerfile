# syntax=docker/dockerfile:1

ARG ALPINE_VERSION=3.22.2

FROM alpine:${ALPINE_VERSION} AS builder

WORKDIR /app
COPY package.json package-lock.json ./

RUN apk add --no-cache npm nodejs \
  && npm ci --omit=dev

COPY index.js ./index.js

FROM alpine:${ALPINE_VERSION}

RUN apk add --no-cache nodejs

WORKDIR /app
COPY --from=builder /app /app

ENTRYPOINT ["node", "/app/index.js"]
CMD []
EXPOSE 8080
