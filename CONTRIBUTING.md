# Contributing to Claude Plugins Marketplace

We welcome plugin submissions from the community!

## Quick Start

1. **Copy the template**
   ```bash
   cp -r plugins/.template plugins/your-plugin-name
   ```

2. **Edit the manifest** at `plugins/your-plugin-name/.claude-plugin/plugin.json`

3. **Add your functionality** (commands, skills, hooks, etc.)

4. **Write documentation** in `plugins/your-plugin-name/README.md`

5. **Validate your plugin**
   ```bash
   ./scripts/validate-plugin.sh plugins/your-plugin-name
   ```

6. **Submit a Pull Request**

## Plugin Guidelines

### Naming

- Use lowercase, hyphenated names: `my-awesome-plugin`
- Be descriptive but concise
- Avoid generic names like `utils` or `helper`

### Manifest Requirements

Your `plugin.json` must include:

```json
{
  "name": "your-plugin-name",
  "description": "Clear, concise description",
  "version": "1.0.0"
}
```

Recommended fields:
- `author.name` - Your name for attribution
- `author.url` - Your profile URL
- `repository` - Link to source code
- `license` - MIT, Apache-2.0, etc.
- `keywords` - For discoverability

### Code Quality

- **No malicious code** - Plugins must not harm users or their systems
- **No credential harvesting** - Never collect or transmit user credentials
- **Clear documentation** - Users should understand what your plugin does
- **Error handling** - Handle edge cases gracefully

### Commands

- Provide clear descriptions in frontmatter
- Document all arguments
- Include usage examples in README

### Skills

- Write descriptive trigger conditions
- Be specific about when the skill should activate
- Test that it activates appropriately

### Hooks

- Document what events your hooks respond to
- Explain any side effects
- Be cautious with file-modifying hooks

## Pull Request Process

1. **Fork this repository**

2. **Create a branch** for your plugin:
   ```bash
   git checkout -b add-plugin/your-plugin-name
   ```

3. **Add your plugin** to the `plugins/` directory

4. **Run validation**:
   ```bash
   ./scripts/validate-plugin.sh plugins/your-plugin-name
   ```

5. **Update the main README** (optional):
   Add your plugin to the "Available Plugins" table

6. **Submit PR** with:
   - Clear title: `Add plugin: your-plugin-name`
   - Description of what your plugin does
   - Any special requirements or dependencies

## Review Criteria

We review plugins for:

- [ ] Valid plugin structure
- [ ] Working functionality
- [ ] Clear documentation
- [ ] No security concerns
- [ ] Appropriate naming

## License

By submitting a plugin, you agree that:
- You have the right to submit the code
- Your plugin will be available under its stated license
- You grant users permission to use the plugin as documented

## Questions?

Open an issue for questions about:
- Plugin development
- Submission process
- Feature requests

Thank you for contributing!
