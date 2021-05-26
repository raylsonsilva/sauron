#
# STAGE 1: prepare
#
FROM golang:1.16.2-alpine3.13 as prepare

WORKDIR /source

#
# STAGE 2: build
#
FROM prepare AS build

COPY . .

RUN CGO_ENABLED=0 go build -ldflags "-s -w" -o bin/outrider -v cmd/outrider.go

#
# STAGE 3: run
#
FROM alpine:3.13 as run

RUN apk add --no-cache ca-certificates \
    libgcc libstdc++ libx11 glib libxrender libxext libintl \
    ttf-dejavu ttf-droid ttf-freefont ttf-liberation ttf-ubuntu-font-family

COPY config/.env /.env
COPY config/static/ /static/

COPY --from=build /source/bin/outrider /outrider
COPY --from=madnight/alpine-wkhtmltopdf-builder:0.12.6-alpine3.10 /bin/wkhtmltopdf /bin/wkhtmltopdf

EXPOSE 8080

ENTRYPOINT ["/outrider"]