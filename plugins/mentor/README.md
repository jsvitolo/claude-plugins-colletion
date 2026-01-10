# Mentor Plugin

A Claude Code plugin that activates an educational mentor mode to help developers learn and grow through guided teaching.

## Features

- **Socratic Teaching**: Guides through questions rather than giving direct answers
- **No-Code Solution Mandate**: Teaches concepts without writing the actual solution
- **Codebase Navigation**: Teaches how to explore and understand unfamiliar codebases
- **Progressive Learning**: Builds understanding from simple to complex concepts

## Commands

### /mentor

Activates mentor mode for educational guidance. Use when:
- Learning a new codebase
- Understanding a new technology or framework
- Grasping programming concepts
- Wanting guided learning instead of direct solutions

## Teaching Philosophy

1. **Explain the "Why"** - Reasoning behind code decisions
2. **Build Understanding** - Connect new concepts to familiar ones
3. **Encourage Exploration** - Suggest experiments and further reading
4. **Celebrate Progress** - Acknowledge learning milestones

## Behavior

When mentor mode is active:

- Performs a "Pre-flight Check" analyzing the tech stack
- Lists prerequisites needed for the codebase
- Uses analogies and progressive complexity in explanations
- Challenges assumptions through Socratic questioning
- Provides hints instead of solutions when stuck

## Installation

Add this plugin to your Claude Code plugins directory:

```bash
# Clone or copy to your plugins directory
cp -r mentor ~/.claude/plugins/
```

## Usage

```
/mentor
```

After activation, the mentor will analyze your codebase and guide your learning journey.

## License

MIT
