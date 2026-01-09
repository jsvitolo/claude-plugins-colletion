# Claude Plugins Marketplace

A community-driven collection of plugins for [Claude Code](https://claude.ai/code).

## Installation

The plugins are installed through Claude Code's marketplace system. First, add the marketplace collection:

```bash
claude plugin marketplace add jsvitolo/claude-plugins-colletion my-claude-code-plugins
```

Then install individual plugins:

```bash
claude plugin install postgres@my-claude-code-plugins
claude plugin install commit-commands@my-claude-code-plugins
```

## Available Plugins

| Plugin | Description | Version |
|--------|-------------|---------|
| [postgres](plugins/postgres) | Read-only PostgreSQL queries with multi-database support | 1.0.0 |
| [commit-commands](plugins/commit-commands) | Streamlined git workflow with /commit, /commit-push-pr, /clean_gone | 1.0.0 |

## Plugin Categories

### Developer Tools
- **commit-commands** - Git workflow automation with Conventional Commits

### Integrations
- **postgres** - Execute read-only SQL queries against PostgreSQL databases

## Creating a Plugin

Use our template to get started:

```bash
cp -r plugins/.template plugins/my-plugin
```

Then edit `plugins/my-plugin/.claude-plugin/plugin.json`:

```json
{
  "name": "my-plugin",
  "description": "What your plugin does",
  "version": "1.0.0",
  "author": {
    "name": "Your Name",
    "url": "https://github.com/yourname"
  }
}
```

See [CONTRIBUTING.md](CONTRIBUTING.md) for full submission guidelines.

## Plugin Structure

```
plugins/
├── my-plugin/
│   ├── .claude-plugin/
│   │   └── plugin.json      # Required manifest
│   ├── commands/            # Slash commands (.md files)
│   ├── skills/              # Agent skills (SKILL.md)
│   ├── agents/              # Custom agents
│   ├── hooks/               # Event handlers
│   │   └── hooks.json
│   ├── .mcp.json           # MCP server configs
│   ├── .lsp.json           # LSP server configs
│   └── README.md           # Plugin documentation
```

## Validation

Before submitting, validate your plugin:

```bash
./scripts/validate-plugin.sh plugins/my-plugin
```

## License

Each plugin maintains its own license. See individual plugin directories.

This marketplace repository is licensed under MIT.
