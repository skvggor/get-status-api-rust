# Get Status API

Simple REST API that returns the current status based on time of day and day of week.

## Description

A lightweight API built with Rust and Axum that provides information about current availability/status. The status is calculated automatically based on the current time (UTC-3 timezone) and day of the week.

## Features

- Automatic status calculation based on time and day
- RESTful API with JSON responses
- Health check endpoint
- Docker support
- Comprehensive test coverage

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

## License

This project is licensed under the Apache License Version 2.0. See the [LICENSE](LICENSE) file for details.
