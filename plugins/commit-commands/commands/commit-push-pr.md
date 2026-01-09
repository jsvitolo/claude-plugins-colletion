---
allowed-tools: Bash(git checkout --branch:*), Bash(git add:*), Bash(git status:*), Bash(git push:*), Bash(git commit:*), Bash(gh pr create:*)
description: Commit, push, and open a PR
---

## Context

- Current git status: !`git status`
- Current git diff (staged and unstaged changes): !`git diff HEAD`
- Current branch: !`git branch --show-current`

## Your task

**BEFORE COMMITTING - BRANCH CHECK:**
If the current branch is `main` or `master`, you MUST ask the user:
"You are on the `{branch}` branch. Do you want to:
1. Create a new branch first (recommended)
2. Commit directly to `{branch}`"

Wait for the user's response before proceeding. If they choose to create a new branch, ask for the branch name or suggest one based on the changes.

**THEN:** Based on the above changes:

1. Create a new branch if user requested
2. Create a single commit with an appropriate message
3. Push the branch to origin
4. Create a pull request using `gh pr create`

**IMPORTANT RULES:**
- Do NOT add any "Co-Authored-By" line to commit messages or PR descriptions
- Do NOT mention Claude, Claude Code, AI, or any indication that this was generated automatically
- The commit message and PR description should appear as if written by a human developer

**COMMIT FORMAT (Conventional Commits):**
Use one of these prefixes based on the type of change:
- `feat:` - New feature or functionality
- `fix:` - Bug fix
- `refactor:` - Code refactoring without changing functionality
- `chore:` - Maintenance tasks, dependencies, configs, etc.

Example: `feat: add user authentication flow`

You have the capability to call multiple tools in a single response. You MUST do all of the above in a single message. Do not use any other tools or do anything else. Do not send any other text or messages besides these tool calls.
