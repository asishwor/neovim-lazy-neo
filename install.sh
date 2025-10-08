#!/bin/bash

# Neovim + LazyVim + Fish Shell Setup Script
# Modern development environment with beautiful themes

set -e

echo "🚀 Installing Beautiful Neovim + LazyVim + Fish Shell Setup"
echo "=========================================================="

# Detect OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if command -v dnf &> /dev/null; then
        OS="fedora"
    elif command -v apt &> /dev/null; then
        OS="ubuntu"
    elif command -v pacman &> /dev/null; then
        OS="arch"
    else
        echo "❌ Unsupported Linux distribution"
        exit 1
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
else
    echo "❌ Unsupported operating system"
    exit 1
fi

echo "✅ Detected OS: $OS"

# Install dependencies based on OS
install_dependencies() {
    echo "📦 Installing dependencies..."
    
    case $OS in
        fedora)
            sudo dnf install -y neovim fish ripgrep fd-find python3-pip curl git nodejs npm unzip
            ;;
        ubuntu)
            sudo apt update
            sudo apt install -y neovim fish ripgrep fd-find python3-pip curl git nodejs npm unzip
            ;;
        arch)
            sudo pacman -S --noconfirm neovim fish ripgrep fd python-pip curl git nodejs npm unzip
            ;;
        macos)
            if ! command -v brew &> /dev/null; then
                echo "Installing Homebrew..."
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            fi
            brew install neovim fish ripgrep fd python3 curl git node npm
            ;;
    esac
}

# Install Starship prompt
install_starship() {
    echo "⭐ Installing Starship prompt..."
    curl -sS https://starship.rs/install.sh | sh -s -- --yes
}

# Install JetBrains Mono Nerd Font
install_font() {
    echo "🔤 Installing JetBrains Mono Nerd Font..."
    
    if [[ "$OS" == "macos" ]]; then
        FONT_DIR="$HOME/Library/Fonts"
    else
        FONT_DIR="$HOME/.local/share/fonts"
    fi
    
    mkdir -p "$FONT_DIR"
    
    curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip -o /tmp/JetBrainsMono.zip
    unzip -o /tmp/JetBrainsMono.zip -d "$FONT_DIR"
    rm /tmp/JetBrainsMono.zip
    
    # Refresh font cache on Linux
    if [[ "$OS" != "macos" ]]; then
        fc-cache -fv
    fi
}

# Backup existing configurations
backup_configs() {
    echo "💾 Backing up existing configurations..."
    
    TIMESTAMP=$(date +%Y%m%d_%H%M%S)
    
    if [[ -d "$HOME/.config/nvim" ]]; then
        mv "$HOME/.config/nvim" "$HOME/.config/nvim.backup.$TIMESTAMP"
        echo "   Backed up Neovim config to ~/.config/nvim.backup.$TIMESTAMP"
    fi
    
    if [[ -d "$HOME/.local/share/nvim" ]]; then
        mv "$HOME/.local/share/nvim" "$HOME/.local/share/nvim.backup.$TIMESTAMP"
        echo "   Backed up Neovim data to ~/.local/share/nvim.backup.$TIMESTAMP"
    fi
    
    if [[ -f "$HOME/.config/fish/config.fish" ]]; then
        mv "$HOME/.config/fish/config.fish" "$HOME/.config/fish/config.fish.backup.$TIMESTAMP"
        echo "   Backed up Fish config to ~/.config/fish/config.fish.backup.$TIMESTAMP"
    fi
}

# Install configurations
install_configs() {
    echo "⚙️  Installing configurations..."
    
    # Create config directories
    mkdir -p "$HOME/.config/nvim"
    mkdir -p "$HOME/.config/fish"
    
    # Copy configurations
    cp -r nvim/* "$HOME/.config/nvim/"
    cp fish/config.fish "$HOME/.config/fish/"
    cp starship.toml "$HOME/.config/"
    
    echo "   Installed Neovim configuration"
    echo "   Installed Fish configuration" 
    echo "   Installed Starship configuration"
}

# Set Fish as default shell
setup_fish() {
    echo "🐚 Setting up Fish shell..."
    
    FISH_PATH=$(which fish)
    
    # Add fish to shells file if not already there
    if ! grep -q "$FISH_PATH" /etc/shells; then
        echo "$FISH_PATH" | sudo tee -a /etc/shells
    fi
    
    # Change default shell to fish
    if [[ "$SHELL" != "$FISH_PATH" ]]; then
        chsh -s "$FISH_PATH"
        echo "   Changed default shell to Fish"
        echo "   Please restart your terminal or run 'exec fish' to start using Fish"
    fi
}

# Initialize Neovim plugins
setup_neovim() {
    echo "🔧 Setting up Neovim plugins..."
    
    # Install plugins headlessly
    nvim --headless +"Lazy! sync" +qa
    
    echo "   Installed and synchronized all plugins"
}

# Main installation function
main() {
    echo
    read -p "Do you want to proceed with the installation? (y/N): " -n 1 -r
    echo
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Installation cancelled."
        exit 0
    fi
    
    echo
    echo "Starting installation..."
    echo
    
    install_dependencies
    install_starship
    install_font
    backup_configs
    install_configs
    setup_fish
    setup_neovim
    
    echo
    echo "🎉 Installation completed successfully!"
    echo
    echo "📋 Next steps:"
    echo "1. Set your terminal font to 'JetBrains Mono Nerd Font'"
    echo "2. Restart your terminal or run 'exec fish'"
    echo "3. Launch Neovim with 'nvim' to see the beautiful setup"
    echo
    echo "📚 For more information, check the README.md file"
    echo
    echo "Happy coding! ✨"
}

main "$@"