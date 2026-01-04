# Get Status API | skvggor.dev

Simple REST API that returns the current status based on time of day and day of week.

## Description

A lightweight API built with Rust and Axum that provides information about current availability/status. The status is calculated automatically based on the current time (UTC-3 timezone) and day of the week.

## Features

- Automatic status calculation based on time and day
- RESTful API with JSON responses
- Health check endpoint
- Docker support
- Comprehensive test coverage

## Technologies

- **Rust 1.92.0** - Programming language
- **Axum 0.6** - Web framework
- **Tokio 1.49.0** - Async runtime
- **Serde 1.0.228** - Serialization
- **Chrono 0.4.42** - Date and time handling
- **Docker** - Containerization

## Status Types

Based on the current time and day, the API returns one of the following statuses:

- **sleep**: 00:00 - 07:59
- **lunch**: 12:00 - 14:00
- **weekend**: Saturday, Sunday (except sleep/lunch times)
- **work**: 08:00 - 18:00 (Monday-Friday)
- **free**: 18:01 - 23:59 (Monday-Friday)

## API Endpoints

### Get Status
```
GET /rust-api/api/v1/status
```

Returns a JSON object with current time and status:

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

Returns `ok` if the service is running.

## Usage

### Running Locally

1. Install Rust dependencies:
```bash
cargo install
```

2. Copy environment variables:
```bash
cp .env.example .env
```

3. Run the application:
```bash
cargo run
```

### Running with Docker

1. Build and run with Docker Compose:
```bash
docker compose up --build
```

2. Or build the image manually:
```bash
docker build -t rust-api-axum .
docker run -p 3333:3333 rust-api-axum
```

### Production Build

Use the provided build script:
```bash
./build-prod.sh
```

This runs tests and builds the release binary to `bin/rust-api-axum`.

## Environment Variables

- `HOST`: Server host (default: 0.0.0.0)
- `PORT`: Server port (default: 3333)

## Testing

Run the test suite:
```bash
cargo test
```

The project includes tests for:
- Time formatting (`test_get_utc_time`)
- Status calculation logic (`test_get_status`)
- API response (`test_response_json`)

## License

See LICENSE file.
