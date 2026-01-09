---
allowed-tools: Bash(git add:*), Bash(git status:*), Bash(git commit:*), Bash(git checkout:*), Bash(git switch:*)
description: Create a git commit
---

## Context

- Current git status: !`git status`
- Current git diff (staged and unstaged changes): !`git diff HEAD`
- Current branch: !`git branch --show-current`
- Recent commits: !`git log --oneline -10`

## Your task

**BEFORE COMMITTING - BRANCH CHECK:**
If the current branch is `main` or `master`, you MUST ask the user:
"You are on the `{branch}` branch. Do you want to:
1. Create a new branch first
2. Commit directly to `{branch}`"

Wait for the user's response before proceeding. If they choose to create a new branch, ask for the branch name.

**THEN:** Based on the above changes, create a single git commit.

**IMPORTANT RULES:**
- Do NOT add any "Co-Authored-By" line to the commit message
- Do NOT mention Claude, Claude Code, AI, or any indication that this commit was generated automatically
- The commit message should appear as if written by a human developer

**COMMIT FORMAT (Conventional Commits):**
Use one of these prefixes based on the type of change:
- `feat:` - New feature or functionality
- `fix:` - Bug fix
- `refactor:` - Code refactoring without changing functionality
- `chore:` - Maintenance tasks, dependencies, configs, etc.

Example: `feat: add user authentication flow`

You have the capability to call multiple tools in a single response. Stage and create the commit using a single message. Do not use any other tools or do anything else. Do not send any other text or messages besides these tool calls.
