#!/bin/bash

# Plugin Validation Script for Claude Plugins Marketplace
# Usage: ./scripts/validate-plugin.sh plugins/my-plugin

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

PLUGIN_DIR=$1
ERRORS=0
WARNINGS=0

log_error() {
    echo -e "${RED}ERROR:${NC} $1"
    ERRORS=$((ERRORS + 1))
}

log_warning() {
    echo -e "${YELLOW}WARNING:${NC} $1"
    WARNINGS=$((WARNINGS + 1))
}

log_success() {
    echo -e "${GREEN}OK:${NC} $1"
}

if [ -z "$PLUGIN_DIR" ]; then
    echo "Usage: $0 <plugin-directory>"
    echo "Example: $0 plugins/my-plugin"
    exit 1
fi

if [ ! -d "$PLUGIN_DIR" ]; then
    log_error "Directory not found: $PLUGIN_DIR"
    exit 1
fi

echo "Validating plugin: $PLUGIN_DIR"
echo "================================"

# Check plugin.json exists
MANIFEST="$PLUGIN_DIR/.claude-plugin/plugin.json"
if [ ! -f "$MANIFEST" ]; then
    log_error "Missing plugin.json at .claude-plugin/plugin.json"
else
    log_success "Found plugin.json"

    # Validate JSON syntax
    if ! python3 -c "import json; json.load(open('$MANIFEST'))" 2>/dev/null; then
        log_error "Invalid JSON in plugin.json"
    else
        log_success "Valid JSON syntax"

        # Check required fields
        NAME=$(python3 -c "import json; print(json.load(open('$MANIFEST')).get('name', ''))" 2>/dev/null)
        DESC=$(python3 -c "import json; print(json.load(open('$MANIFEST')).get('description', ''))" 2>/dev/null)
        VERSION=$(python3 -c "import json; print(json.load(open('$MANIFEST')).get('version', ''))" 2>/dev/null)

        if [ -z "$NAME" ]; then
            log_error "Missing 'name' field in plugin.json"
        else
            log_success "Has name: $NAME"
        fi

        if [ -z "$DESC" ]; then
            log_error "Missing 'description' field in plugin.json"
        else
            log_success "Has description"
        fi

        if [ -z "$VERSION" ]; then
            log_error "Missing 'version' field in plugin.json"
        else
            # Validate semver format
            if [[ $VERSION =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
                log_success "Valid version: $VERSION"
            else
                log_warning "Version '$VERSION' doesn't follow semver (X.Y.Z)"
            fi
        fi
    fi
fi

# Check README exists
if [ ! -f "$PLUGIN_DIR/README.md" ]; then
    log_warning "Missing README.md (recommended for documentation)"
else
    log_success "Found README.md"
fi

# Validate commands
COMMANDS_DIR="$PLUGIN_DIR/commands"
if [ -d "$COMMANDS_DIR" ]; then
    CMD_COUNT=$(find "$COMMANDS_DIR" -name "*.md" | wc -l | tr -d ' ')
    if [ "$CMD_COUNT" -gt 0 ]; then
        log_success "Found $CMD_COUNT command(s)"

        # Check each command has frontmatter with required description field
        for cmd in "$COMMANDS_DIR"/*.md; do
            [ -f "$cmd" ] || continue
            if ! head -1 "$cmd" | grep -q "^---$"; then
                log_warning "Command $(basename "$cmd") missing frontmatter (---)"
            else
                # Check for description field in frontmatter
                FRONTMATTER=$(sed -n '1,/^---$/p' "$cmd" | tail -n +2)
                if ! echo "$FRONTMATTER" | grep -q "^description:"; then
                    log_error "Command $(basename "$cmd") missing required 'description' field in frontmatter"
                fi
            fi
        done
    fi
fi

# Validate skills
SKILLS_DIR="$PLUGIN_DIR/skills"
if [ -d "$SKILLS_DIR" ]; then
    SKILL_COUNT=$(find "$SKILLS_DIR" -name "SKILL.md" | wc -l | tr -d ' ')
    if [ "$SKILL_COUNT" -gt 0 ]; then
        log_success "Found $SKILL_COUNT skill(s)"

        # Check each skill has required frontmatter fields
        for skill in "$SKILLS_DIR"/*/SKILL.md; do
            [ -f "$skill" ] || continue
            SKILL_NAME=$(dirname "$skill" | xargs basename)
            if ! head -1 "$skill" | grep -q "^---$"; then
                log_error "Skill '$SKILL_NAME' missing frontmatter (---)"
            else
                # Extract frontmatter (between first and second ---)
                FRONTMATTER=$(awk '/^---$/{if(++c==2)exit}c==1' "$skill")
                if ! echo "$FRONTMATTER" | grep -q "^name:"; then
                    log_error "Skill '$SKILL_NAME' missing required 'name' field in frontmatter"
                fi
                if ! echo "$FRONTMATTER" | grep -q "^description:"; then
                    log_error "Skill '$SKILL_NAME' missing required 'description' field in frontmatter"
                fi
            fi
        done
    fi
fi

# Validate hooks
HOOKS_FILE="$PLUGIN_DIR/hooks/hooks.json"
if [ -f "$HOOKS_FILE" ]; then
    if python3 -c "import json; json.load(open('$HOOKS_FILE'))" 2>/dev/null; then
        log_success "Valid hooks.json"
    else
        log_error "Invalid JSON in hooks/hooks.json"
    fi
fi

# Validate MCP config
MCP_FILE="$PLUGIN_DIR/.mcp.json"
if [ -f "$MCP_FILE" ]; then
    if python3 -c "import json; json.load(open('$MCP_FILE'))" 2>/dev/null; then
        log_success "Valid .mcp.json"
    else
        log_error "Invalid JSON in .mcp.json"
    fi
fi

# Validate LSP config
LSP_FILE="$PLUGIN_DIR/.lsp.json"
if [ -f "$LSP_FILE" ]; then
    if python3 -c "import json; json.load(open('$LSP_FILE'))" 2>/dev/null; then
        log_success "Valid .lsp.json"
    else
        log_error "Invalid JSON in .lsp.json"
    fi
fi

# Summary
echo ""
echo "================================"
if [ $ERRORS -gt 0 ]; then
    echo -e "${RED}Validation FAILED${NC}: $ERRORS error(s), $WARNINGS warning(s)"
    exit 1
elif [ $WARNINGS -gt 0 ]; then
    echo -e "${YELLOW}Validation PASSED with warnings${NC}: $WARNINGS warning(s)"
    exit 0
else
    echo -e "${GREEN}Validation PASSED${NC}"
    exit 0
fi
