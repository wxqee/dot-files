# Dot-File - AI-Powered Configuration Management

A simple, intelligent way to manage your dotfiles with AI assistance.

---

## 🌟 Features

- 🤖 **AI-Powered Workflow**: Natural language commands for configuration
- 📦 **Multi-App Support**: tmux, zsh, vim, git and more
- 🔄 **Automatic Backups**: Safe changes with automatic backups
- 🔒 **Security-First**: Template variables for sensitive data
- 📱 **Simple Commands**: No complex CLI, just chat with AI
- 🤝 **Community-Driven**: Share and discover configurations

---

## 🚀 For Users - Quick Start

### Installation

```bash
# Clone the repository
git clone git@github.com:wxqee/dot-files.git ~/works/dot-files
cd ~/works/dot-files

# Run the AI workflow (recommended)
claude dot-file.md

# OR use the interactive setup wizard
./scripts/setup.sh
```

### Quick Setup

```bash
# Setup all applications with one command
./scripts/setup.sh

# Or setup individual applications
./scripts/install-vim-plugins.sh   # Install Vim plugins via Vundle
./scripts/install-oh-my-zsh.sh     # Install Oh-My-Zsh with plugins
```

### Usage

```bash
# Interactive mode (recommended)
claude dot-file.md

# Direct commands
@dot-file configure tmux with vim-style
@dot-file update tmux
@dot-file share tmux as "my-awesome-config"
```

### Available Commands

| Command | Description |
|---------|-------------|
| `@dot-file configure <app> [style]` | Configure an application |
| `@dot-file update [app]` | Update configuration |
| `@dot-file share <app> as "name"` | Share your config |
| `@dot-file status` | Show current status |
| `@dot-file restore <app>` | Restore from backup |

### Supported Applications

| App | Configuration Types | Description |
|-----|---------------------|-------------|
| **tmux** | `default`, `vim-style` | Terminal multiplexer with Vim keybindings |
| **zsh** | `default` | Z shell with oh-my-zsh and plugins |
| **vim** | `default` | Vi improved with plugins |
| **git** | `default` | Version control with useful aliases |

### Configuration Workflow

1. **Select Application**: Choose which app to configure
2. **Choose Style**: Select configuration type
3. **Review Changes**: Preview before applying
4. **Auto Backup**: Existing config is backed up
5. **Apply Config**: New configuration is applied
6. **Get Feedback**: See what was changed

### Security

- **Never commit sensitive data** to this repository
- Use **template variables** for secrets:
  ```
  email = {{ secrets.git_email }}
  ```
- User-specific config goes in `config.json` (gitignored)
- Environment variables are used for sensitive data

---

## 🧑‍💻 For Contributors - How to Contribute

### Adding a New Application

1. **Create application directory**:
   ```bash
   mkdir -p apps/<app-name>
   ```

2. **Create configuration files**:
   ```bash
   touch apps/<app-name>/default.conf
   touch apps/<app-name>/config.schema.json
   ```

3. **Update registry.json**:
   ```json
   {
     "apps": {
       "<app-name>": {
         "name": "<app-name>",
         "description": "Description",
         "config_file": "~/.config-file",
         "config_types": ["default"],
         "post_apply": [],
         "platforms": ["macOS", "Linux"]
       }
     }
   }
   ```

4. **Add tests** (optional but recommended)

### Adding a New Configuration Type

1. **Create configuration file**:
   ```bash
   touch apps/<app-name>/<config-type>.conf
   ```

2. **Update registry.json**:
   ```json
   "config_types": ["default", "<config-type>"]
   ```

3. **Validate your configuration**:
   ```bash
   ./scripts/validate.sh <app-name> <config-type>
   ```

4. **Test the configuration** locally before submitting

### Sharing Your Configuration

1. **Capture your local config**:
   ```bash
   ./scripts/capture.sh <app-name> <config-name>
   ```

2. **Review and clean**:
   - Remove any sensitive data
   - Use template variables for personalization
   - Add comments if needed

3. **Validate**:
   ```bash
   ./scripts/validate.sh <app-name> <config-name>
   ```

4. **Submit a PR**:
   ```bash
   git add apps/<app-name>/<config-name>.conf
   git commit -m "Add <config-name> for <app-name>"
   git push origin feature/<config-name>
   ```

### Contribution Guidelines

- ✅ **Descriptive names**: Use meaningful names for configurations
- ✅ **Well-documented**: Add comments for complex configurations
- ✅ **Cross-platform**: Support macOS and Linux where possible
- ✅ **No secrets**: Never include passwords, tokens, or personal data
- ✅ **Tested**: Verify configurations work before submitting

---

## 📁 Project Structure

```
dot-files/
├── apps/                    # Application configurations
│   ├── tmux/                # tmux configs
│   │   ├── default.conf     # Base configuration
│   │   └── vim-style.conf   # Vim-style configuration
│   ├── zsh/                 # zsh configs
│   ├── vim/                 # vim configs
│   └── git/                 # git configs
├── scripts/                 # Helper scripts
│   ├── backup.sh            # Backup existing config
│   ├── apply.sh             # Apply new configuration
│   ├── validate.sh          # Validate configuration
│   ├── capture.sh           # Capture local config
│   ├── setup.sh             # Interactive setup wizard
│   ├── install-vim-plugins.sh  # Install Vim plugins via Vundle
│   └── install-oh-my-zsh.sh    # Install Oh-My-Zsh with plugins
├── registry.json            # Application registry
├── config.json              # User preferences (gitignored)
├── dot-file.md              # AI workflow entry point
└── README.md                # This file
```

---

## 🔧 Development

### Running Tests

```bash
# Validate all configurations
./scripts/validate.sh <app> <config-type>

# Test configuration application
./scripts/apply.sh <app> <config-type>
```

### Adding New Scripts

Place new scripts in the `scripts/` directory with proper documentation.

---

## 📄 License

MIT License - See [LICENSE](LICENSE) for details

---

## 🤝 Contributing

Contributions are welcome! Please feel free to:

- Add new application configurations
- Improve existing configurations
- Add new features to the workflow
- Report issues and bugs

---

## 📞 Support

If you encounter any issues or have questions, please open an issue on GitHub.

---

*Built with ❤️ for the developer community*
