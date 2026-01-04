FROM rust:1.92.0 as builder

WORKDIR /usr/src/app

COPY . .

CMD ["./bin/rust-api-axum"]
