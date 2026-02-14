FROM node:22-alpine3.20

RUN apk add --no-cache git bash

# Create a non-root user (similar to release-it-containerized)
RUN adduser -D appuser

WORKDIR /app

# Run as non-root user
USER appuser

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
