# Rust Dev Plugin

Professional Rust development toolkit for Claude Code with expert guidance, project scaffolding, and async programming patterns.

## Components

### Agent: rust-pro

Expert Rust developer specializing in modern Rust 1.75+ development:

- Advanced async programming with Tokio
- Type system mastery (GATs, lifetimes, traits)
- Memory safety and ownership patterns
- Performance optimization and systems programming
- Web development with axum, tower, hyper
- Error handling with thiserror and anyhow
- Testing with proptest, criterion, mockall
- Unsafe code and FFI integration

### Command: /rust-project

Scaffolds production-ready Rust projects:

```
/rust-project Create a CLI tool for file processing
/rust-project Web API with axum and PostgreSQL
/rust-project Library for async utilities
```

**Supported project types:**
- Binary (CLI tools, applications)
- Library (reusable crates)
- Workspace (multi-crate projects)
- Web API (Axum/Actix services)
- WebAssembly (browser applications)

### Skill: rust-async-patterns

Auto-invoked for async Rust development:

- Concurrent task execution with JoinSet
- Channel patterns (mpsc, broadcast, oneshot, watch)
- Async error handling with anyhow/thiserror
- Graceful shutdown patterns
- Async traits implementation
- Streams and async iteration
- Resource management (RwLock, Semaphore, pools)

## Installation

```bash
/plugin install rust-dev
```

## Usage Examples

**Get expert Rust help:**
```
How do I implement a lock-free queue in Rust?
```

**Scaffold a new project:**
```
/rust-project Create a high-performance web scraper with rate limiting
```

**Async patterns (auto-invoked):**
```
Help me implement concurrent API calls with timeout and retry
```

## License

MIT
