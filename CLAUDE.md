# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a community-driven marketplace for Claude Code plugins. Plugins extend Claude Code with commands, skills, hooks, MCP servers, and LSP servers.

## Commands

**Validate a plugin before submission:**
```bash
./scripts/validate-plugin.sh plugins/<plugin-name>
```

**Create a new plugin from template:**
```bash
cp -r plugins/.template plugins/<plugin-name>
```

## Plugin Structure

Each plugin lives in `plugins/<plugin-name>/` with this structure:

```
plugins/<plugin-name>/
├── .claude-plugin/
│   └── plugin.json      # Required manifest (name, description, version, author)
├── commands/            # Slash commands as .md files with frontmatter
├── skills/              # Auto-invoked skills (SKILL.md files)
├── hooks/
│   └── hooks.json       # Event handlers (PostToolUse, etc.)
├── .mcp.json            # MCP server configurations
├── .lsp.json            # LSP server configurations
└── README.md            # Plugin documentation
```

## Key Files

- `.claude-plugin/marketplace.json` - Marketplace manifest (required for Claude Code)
- `plugins/.template/` - Starting point for new plugins (copy, don't modify)
- `scripts/validate-plugin.sh` - Validates plugin structure and JSON syntax

## Plugin Development

**Manifest (`plugin.json`) required fields:**
- `name`: lowercase, hyphenated identifier
- `description`: concise purpose description
- `version`: semver format (X.Y.Z)
- `author.name`: contributor name

**Commands:** Markdown files with YAML frontmatter containing `description`. Use `$ARGUMENTS` to capture user input.

**Skills:** SKILL.md files with frontmatter (`name`, `description`). Automatically invoked based on context matching.

**Hooks:** JSON format specifying event matchers and commands. Example hook events: `PostToolUse`.

## Validation Requirements

The validation script checks:
- `plugin.json` exists and contains valid JSON
- Required fields present (name, description, version)
- Version follows semver
- Commands have frontmatter
- All JSON files are syntactically valid
