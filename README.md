# Get Status API

Simple REST API that returns the current status based on time of day and day of week.

## Endpoints

### Status
```
GET /rust-api/api/v1/status
```

```json
{
  "time": "14:30",
  "status": "lunch"
}
```

### Health Check
```
GET /rust-api/api/v1/healthcheck
```

## Run Locally

```bash
cargo run
```

## Deploy with Docker

For production deployment with Docker and Caddy reverse proxy, create a `compose.yml` file based on `compose.yml.example`:

```yaml
services:
  rust-api:
    build:
      context: .
      dockerfile: Dockerfile
    restart: unless-stopped
    networks:
      - caddy_net
    labels:
      - caddy=your-subdomain.yourdomain.com
      - caddy.reverse_proxy={{upstreams 3003}}
      - caddy.encode=zstd gzip
    expose:
      - 3003
    env_file:
      - .env

networks:
  caddy_net:
    external: true
```

Replace `your-subdomain.yourdomain.com` with your actual domain. Create a `.env` file with your environment variables.

Then run:
```bash
docker compose up -d --build
```

## License

Apache License Version 2.0
