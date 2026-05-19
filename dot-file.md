# Dot-File Configuration Workflow

## Welcome to Dot-File!
A simple, AI-powered configuration management system.

## Quick Start
1. Clone this repo
2. Run: `@dot-file` or use natural language commands

## Available Commands
- `@dot-file configure <app> [style]` - Configure an application
- `@dot-file update [app]` - Update configuration
- `@dot-file share <app> as "name"` - Share your config
- `@dot-file status` - Show status
- `@dot-file restore <app>` - Restore from backup

## Supported Apps
- tmux - Terminal multiplexer
- zsh - Z shell
- vim - Vi improved
- git - Version control

## Configuration Types
| App | Types |
|-----|-------|
| tmux | default, vim-style |
| zsh | default |
| vim | default |
| git | default |

## Workflow Steps
1. Select application
2. Choose configuration type
3. Review changes
4. Backup existing config
5. Apply new configuration
6. Get feedback

## Security
- Sensitive data uses environment variables: `{{ env.SECRET }}`
- Auto-detect sensitive information before committing
- User-specific config in `config.json` (gitignored)

## Example Usage
```
@dot-file configure tmux with vim-style
@dot-file update tmux
@dot-file share tmux as "my-awesome-config"
```

## Files Structure
```
dot-files/
├── apps/           # Application configurations
├── scripts/        # Helper scripts
├── config.json     # User preferences
├── registry.json   # App registry
└── @dot-file.md    # This file
```