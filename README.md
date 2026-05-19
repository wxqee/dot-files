# Dot-File - AI-Powered Configuration Management

A simple, intelligent way to manage your dotfiles with AI assistance.

## Features
- 🤖 AI-powered configuration workflow
- 📦 Support for tmux, zsh, vim, git and more
- 🔄 Automatic backups before changes
- 🔒 Security-first approach
- 📱 Simple natural language commands

## Quick Start

```bash
# Clone the repo
git clone <repo-url> ~/works/dot-files
cd ~/works/dot-files

# Run the AI workflow
claude '@dot-file.md'

# Or use direct commands
@dot-file configure tmux with vim-style
```

## Commands

| Command | Description |
|---------|-------------|
| `@dot-file` | Start interactive mode |
| `@dot-file configure <app> [style]` | Configure an app |
| `@dot-file update [app]` | Update config |
| `@dot-file share <app> as "name"` | Share your config |
| `@dot-file status` | Show status |

## Supported Apps

- **tmux** - Terminal multiplexer with Vim keybindings
- **zsh** - Z shell with plugins
- **vim** - Vi improved with plugins
- **git** - Version control configuration

## Project Structure

```
dot-files/
├── apps/           # Application configurations
│   ├── tmux/       # tmux configs
│   ├── zsh/        # zsh configs
│   ├── vim/        # vim configs
│   └── git/        # git configs
├── scripts/        # Helper scripts
├── config.json     # User preferences (gitignored)
├── registry.json   # App registry
└── dot-file.md     # AI workflow entry
```

## Security

- Never commit passwords or tokens
- Use environment variables for secrets
- Auto-detection of sensitive data
- User-specific config is gitignored

## Contributing

1. Fork the repo
2. Add your configuration
3. Run validation
4. Submit a PR

## License

MIT