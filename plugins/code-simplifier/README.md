# Code Simplifier Plugin

A Claude Code plugin that automatically simplifies and refines code for clarity, consistency, and maintainability while preserving functionality.

## Features

- **Automatic Invocation**: Triggered after code is written or modified
- **Functionality Preservation**: Never changes what code does, only how it does it
- **Project Standards**: Applies coding standards from your CLAUDE.md
- **Balanced Approach**: Prioritizes readable, explicit code over overly compact solutions

## Skills

### code-simplifier

Automatically invoked when code has been written or modified. The skill:

1. Identifies recently modified code sections
2. Analyzes for opportunities to improve clarity and consistency
3. Applies project-specific best practices
4. Ensures all functionality remains unchanged
5. Verifies the refined code is simpler and more maintainable

## Best Practices Applied

- ES modules with proper import sorting
- `function` keyword over arrow functions
- Explicit return type annotations
- Proper React component patterns
- Consistent naming conventions
- Clear error handling patterns
- Avoids nested ternary operators
- Prioritizes clarity over brevity

## Installation

Add this plugin to your Claude Code plugins directory:

```bash
# Clone or copy to your plugins directory
cp -r code-simplifier ~/.claude/plugins/
```

## Usage

The plugin works automatically. After writing or modifying code, the code-simplifier skill will be invoked to refine your implementation.

## License

MIT
