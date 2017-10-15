FROM gcc:7.2 AS builder
COPY src /src
RUN gcc -static -o /src/app /src/app.c && strip -R .comment -s /src/app

FROM scratch
COPY --from=builder /src/app .
CMD ["./app"]


