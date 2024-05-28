FROM scratch
ENTRYPOINT ["/healthcheck"]
COPY healthcheck /