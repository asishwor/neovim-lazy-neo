# 🚀 Beautiful Neovim + LazyVim + Fish Shell Configuration

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Neovim](https://img.shields.io/badge/Neovim-0.9+-green.svg)](https://neovim.io/)
[![LazyVim](https://img.shields.io/badge/LazyVim-Latest-blue.svg)](https://lazyvim.org/)

A modern, beautiful, and feature-rich Neovim configuration with LazyVim, Fish shell, and Starship prompt. This setup provides a complete development environment with stunning visuals and powerful functionality.

![Preview](https://via.placeholder.com/800x400/1e1e2e/cdd6f4?text=Beautiful+Neovim+Setup)

## ⚡ Quick Installation

```bash
git clone git@github.com:asishwor/neovim-lazy-neo.git
cd neovim-lazy-neo
./install.sh
```

## 📁 Repository Structure

```
neovim-lazy-neo/
├── nvim/                   # Neovim configuration
│   ├── lua/
│   │   ├── config/         # LazyVim base configuration
│   │   └── plugins/        # Custom plugin configurations
│   │       ├── colorscheme.lua  # Catppuccin theme setup
│   │       ├── ui.lua          # UI enhancements
│   │       └── development.lua # Development tools
│   └── init.lua           # Main configuration entry point
├── fish/                   # Fish shell configuration
│   └── config.fish        # Fish shell settings and aliases
├── starship.toml          # Starship prompt configuration
├── install.sh             # Automated installation script
└── README.md              # This file
```

## 📦 What's Installed

### Core Components
- **Neovim** - Latest version with LazyVim configuration
- **Fish Shell** - Modern shell with intelligent features
- **Starship Prompt** - Beautiful cross-shell prompt
- **JetBrains Mono Nerd Font** - Font with programming ligatures and icons

### Development Tools
- **ripgrep** - Fast text search
- **fd-find** - Modern alternative to find
- **LazyVim** - Modern Neovim distribution

## 🎨 Beautiful Theme & UI

### Catppuccin Theme
- **Flavor**: Mocha (dark theme)
- Beautiful, consistent colors across all components
- Integrated with all plugins for a cohesive experience

### Modern UI Components
- **Alpha Dashboard** - Beautiful startup screen with ASCII art
- **Lualine** - Elegant status line with git integration
- **Bufferline** - Tab-like buffer management
- **Indent Guides** - Visual indentation lines
- **Noice** - Better command line, messages, and popups

## 🔧 Key Features

### Editor Enhancements
- **Auto-completion** with Blink.cmp
- **Syntax highlighting** with Treesitter
- **Auto-pairs** for brackets and quotes
- **Smart commenting** with Comment.nvim
- **Surround** text objects
- **Multiple cursors** support
- **Leap** for fast navigation
- **Code folding** with UFO

### Development Tools
- **LSP integration** with Mason
- **Formatting** with Conform
- **Linting** with nvim-lint
- **Git integration** with Gitsigns
- **Terminal integration** with ToggleTerm
- **File search** with Telescope
- **Project management** features

### Fish Shell Features
- **Intelligent autosuggestions**
- **Syntax highlighting** as you type
- **Modern aliases** for common commands
- **Git aliases** for faster workflow
- **Custom functions** (mkcd, extract)
- **Vi key bindings**

## 🚀 Getting Started

### 1. Terminal Font Setup
Make sure your terminal is using **JetBrains Mono Nerd Font**:
- The font is already installed in `~/.local/share/fonts/`
- Configure your terminal emulator to use "JetBrains Mono Nerd Font"

### 2. Launch Neovim
```bash
nvim
```

### 3. Key Bindings (Leader key is `<space>`)

#### Essential Shortcuts
- `<space>ff` - Find files (Telescope)
- `<space>fg` - Live grep (search in files)
- `<space>fb` - Browse buffers
- `<space>e` - Toggle file explorer
- `<space>gg` - Open Lazygit
- `<Ctrl-/>` - Toggle terminal
- `<space>w` - Save file
- `<space>q` - Quit

#### Navigation
- `s` + `<chars>` - Leap to any location
- `<Ctrl-h/j/k/l>` - Move between windows
- `<Shift-h/l>` - Previous/next buffer

#### Development
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Show hover documentation
- `<space>ca` - Code actions
- `<space>rn` - Rename symbol

### 4. Fish Shell Features
Your shell now includes:
- **Intelligent autosuggestions** - Press → to accept
- **Syntax highlighting** - Commands turn green when valid
- **Better aliases**:
  - `ll` = `ls -la`
  - `vim` = `nvim` 
  - `gs` = `git status`
  - `ga` = `git add`
  - `gc` = `git commit`

### 5. Plugin Management
- `:Lazy` - Open plugin manager
- `:Mason` - Manage LSP servers, formatters, linters

## 🎯 Customization

### Configuration Files
- Neovim config: `~/.config/nvim/`
- Fish config: `~/.config/fish/config.fish`
- Starship config: `~/.config/starship.toml`

### Custom Plugins
Add custom plugins in `~/.config/nvim/lua/plugins/` directory.

### Theme Customization
Edit `~/.config/nvim/lua/plugins/colorscheme.lua` to customize the theme.

## 📂 Backup Information
Your previous configurations have been backed up:
- Old Neovim config: `~/.config/nvim.backup.*`
- Old Neovim data: `~/.local/share/nvim.backup.*`

## 🎉 Features to Explore

1. **Dashboard** - Open nvim without arguments to see the beautiful dashboard
2. **File Explorer** - Press `<space>e` to toggle the file tree
3. **Fuzzy Finding** - Press `<space>ff` to quickly find files
4. **Git Integration** - See git status in the gutter and statusline
5. **Terminal Integration** - Press `Ctrl-\` for floating terminal
6. **Code Intelligence** - Hover, go-to-definition, and auto-completion
7. **Multi-cursor Editing** - Select multiple occurrences with `Ctrl-n`
8. **Quick Search/Replace** - Use `:s/old/new/g` or `<space>sr` for global search

## 🔧 Troubleshooting

### If terminal doesn't show icons:
1. Ensure your terminal uses "JetBrains Mono Nerd Font"
2. Check if the font is available: `fc-list | grep -i jetbrains`

### If Fish isn't the default shell:
Restart your terminal or run:
```bash
exec fish
```

### For any plugin issues:
```
:Lazy sync
```

Enjoy your beautiful and modern development environment! 🎨✨

---

**Created with ❤️ - Happy coding!**