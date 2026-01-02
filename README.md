# Claude Plugins Marketplace

A community-driven collection of plugins for [Claude Code](https://claude.com/claude-code).

## Quick Install

```bash
# Install a plugin from this marketplace
claude /plugin install github:jonesvitolo/claude-plugins-colletion/plugins/<plugin-name>

# Or clone and use locally
git clone https://github.com/jonesvitolo/claude-plugins-colletion.git
claude --plugin-dir ./claude-plugins-colletion/plugins/<plugin-name>
```

## Available Plugins

| Plugin | Description | Version |
|--------|-------------|---------|
| [postgres](plugins/postgres) | Read-only PostgreSQL queries with multi-database support | 1.0.0 |

## Plugin Categories

- **Developer Tools** - Code generation, testing, debugging
- **Productivity** - Task management, automation, workflows
- **Integrations** - External services, APIs, databases
- **AI/ML** - Model training, data processing, analysis
- **Documentation** - Doc generation, API docs, changelogs

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
