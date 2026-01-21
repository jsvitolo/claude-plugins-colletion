# postgres

Read-only PostgreSQL query skill for Claude Code. Query multiple databases safely with write protection.

## Installation

```bash
claude /plugin install github:jonesvitolo/claude-plugins-colletion/plugins/postgres
```

Or manually:

```bash
git clone https://github.com/jonesvitolo/claude-plugins-colletion.git
claude --plugin-dir ./claude-plugins-colletion/plugins/postgres
```

## Requirements

```bash
uv pip install psycopg2-binary
```

Or use `uv run` which automatically manages dependencies (recommended).

## Setup

1. Copy the example config:
```bash
cp connections.example.json connections.json
```

2. Add your database credentials:
```json
{
  "databases": [
    {
      "name": "prod",
      "description": "Production - users, orders, transactions",
      "host": "db.example.com",
      "port": 5432,
      "database": "app_prod",
      "user": "readonly",
      "password": "secret",
      "sslmode": "require"
    }
  ]
}
```

3. Secure the config:
```bash
chmod 600 connections.json
```

## Usage

The skill is automatically invoked when Claude detects you're working with PostgreSQL databases.

### Manual commands

```bash
# List configured databases
uv run --with psycopg2-binary scripts/query.py --list

# List tables
uv run --with psycopg2-binary scripts/query.py --db prod --tables

# Show schema
uv run --with psycopg2-binary scripts/query.py --db prod --schema

# Run query
uv run --with psycopg2-binary scripts/query.py --db prod --query "SELECT * FROM users" --limit 100
```

## Config Fields

| Field | Required | Default | Description |
|-------|----------|---------|-------------|
| name | Yes | - | Database identifier |
| description | Yes | - | What data it contains (for auto-selection) |
| host | Yes | - | Hostname |
| port | No | 5432 | Port |
| database | Yes | - | Database name |
| user | Yes | - | Username |
| password | Yes | - | Password |
| sslmode | No | prefer | disable, allow, prefer, require, verify-ca, verify-full |

## Safety Features

- **Read-only sessions**: PostgreSQL `readonly=True` mode blocks writes at database level
- **Query validation**: Only SELECT, SHOW, EXPLAIN, WITH allowed
- **Single statement**: No multi-statement queries (prevents `SELECT 1; DROP TABLE`)
- **Timeouts**: 30s query timeout, 10s connection timeout
- **Memory cap**: Max 10,000 rows per query
- **Credential protection**: Passwords sanitized from error messages

## License

MIT
