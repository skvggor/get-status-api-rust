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

```bash
docker compose up -d --build
```

## License

Apache License Version 2.0
