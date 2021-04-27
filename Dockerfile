FROM alpine

RUN apk update && apk add --no-cache git curl bash \
    ca-certificates tzdata \
    && update-ca-certificates

WORKDIR /app

COPY . .

ENV FILE="retry"
ENV PATTERN="example"
ENV URL="https://example.org"
ENV INSECURE=1
ENV INTERVAL="5m"
ENV MAX_RETRY=2

# see https://pushover.net/api#priority for more informataion
ENV TOKEN=""
ENV USER=""
ENV TITLE="Website changed"
ENV MESSAGE="The websites content changed"
ENV PRIO=1
ENV RETRY=0
ENV EXPIRE=0

CMD ["/app/entrypoint.sh"]

