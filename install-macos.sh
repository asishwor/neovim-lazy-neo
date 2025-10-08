#!/bin/bash

# Neovim + LazyVim + Fish Shell Setup Script - macOS Optimized
# Modern development environment with beautiful themes for macOS

set -e

echo "🍎 Installing Beautiful Neovim + LazyVim + Fish Shell Setup for macOS"
echo "=================================================================="

# Check if we're on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "❌ This script is designed for macOS only"
    echo "💡 Use ./install.sh for other platforms"
    exit 1
fi

echo "✅ macOS detected"

# Check if Xcode Command Line Tools are installed
check_xcode_tools() {
    if ! xcode-select -p &> /dev/null; then
        echo "📦 Installing Xcode Command Line Tools..."
        xcode-select --install
        echo "⏳ Please complete the Xcode Command Line Tools installation and re-run this script"
        exit 1
    fi
}

# Install Homebrew if not present
install_homebrew() {
    if ! command -v brew &> /dev/null; then
        echo "🍺 Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        # Add Homebrew to PATH for Apple Silicon Macs
        if [[ $(uname -m) == "arm64" ]]; then
            echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
            eval "$(/opt/homebrew/bin/brew shellenv)"
        else
            echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
            eval "$(/usr/local/bin/brew shellenv)"
        fi
    else
        echo "🍺 Updating Homebrew..."
        brew update
    fi
}

# Install dependencies using Homebrew
install_dependencies() {
    echo "📦 Installing dependencies with Homebrew..."
    
    # Core dependencies
    brew install neovim fish ripgrep fd python3 curl git node npm
    
    # Additional tools for better development experience
    brew install --cask font-jetbrains-mono-nerd-font 2>/dev/null || {
        echo "📝 Note: Font installation requires manual approval in System Preferences"
        echo "📝 Installing font manually..."
        install_font_manual
    }
    
    # Optional but recommended tools
    brew install lazygit tree bat exa htop
}

# Manual font installation for macOS
install_font_manual() {
    echo "🔤 Installing JetBrains Mono Nerd Font manually..."
    
    FONT_DIR="$HOME/Library/Fonts"
    mkdir -p "$FONT_DIR"
    
    # Download and install font
    curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip -o /tmp/JetBrainsMono.zip
    unzip -o /tmp/JetBrainsMono.zip -d /tmp/JetBrainsMono
    cp /tmp/JetBrainsMono/*.ttf "$FONT_DIR/"
    rm -rf /tmp/JetBrainsMono.zip /tmp/JetBrainsMono
    
    echo "✅ Font installed to ~/Library/Fonts/"
    echo "💡 You may need to restart applications to see the new font"
}

# Install Starship prompt
install_starship() {
    echo "⭐ Installing Starship prompt..."
    curl -sS https://starship.rs/install.sh | sh -s -- --yes
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
        mkdir -p "$HOME/.config/fish"
        mv "$HOME/.config/fish/config.fish" "$HOME/.config/fish/config.fish.backup.$TIMESTAMP"
        echo "   Backed up Fish config to ~/.config/fish/config.fish.backup.$TIMESTAMP"
    fi
}

# Install configurations with macOS-specific adjustments
install_configs() {
    echo "⚙️  Installing configurations..."
    
    # Create config directories
    mkdir -p "$HOME/.config/nvim"
    mkdir -p "$HOME/.config/fish"
    
    # Copy configurations
    cp -r nvim/* "$HOME/.config/nvim/"
    cp fish/config.fish "$HOME/.config/fish/"
    cp starship.toml "$HOME/.config/"
    
    # macOS-specific Fish configuration adjustments
    cat >> "$HOME/.config/fish/config.fish" << 'EOF'

# macOS-specific configurations
if test (uname) = "Darwin"
    # Add Homebrew to PATH
    if test -d /opt/homebrew/bin
        fish_add_path /opt/homebrew/bin
        fish_add_path /opt/homebrew/sbin
    end
    
    if test -d /usr/local/bin
        fish_add_path /usr/local/bin
        fish_add_path /usr/local/sbin
    end
    
    # macOS aliases
    alias o='open'
    alias pbcopy='pbcopy'
    alias pbpaste='pbpaste'
    alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
    alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
    alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
    
    # Use GNU tools if available
    if command -v gls >/dev/null
        alias ls='gls --color=auto'
    end
    
    if command -v gtar >/dev/null
        alias tar='gtar'
    end
end
EOF
    
    echo "   Installed Neovim configuration"
    echo "   Installed Fish configuration with macOS optimizations" 
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

# macOS-specific terminal configuration suggestions
suggest_terminal_setup() {
    echo
    echo "🖥️  macOS Terminal Setup Suggestions:"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo
    echo "📱 For iTerm2 users:"
    echo "1. Download iTerm2: https://iterm2.com/"
    echo "2. Set font to 'JetBrainsMono Nerd Font' in Preferences > Profiles > Text"
    echo "3. Enable 'Use built-in Powerline glyphs' option"
    echo "4. Set color scheme to 'Catppuccin Mocha' if available"
    echo
    echo "📱 For Terminal.app users:"
    echo "1. Go to Terminal > Preferences > Profiles"
    echo "2. Set font to 'JetBrainsMono Nerd Font'"
    echo "3. Adjust colors to use a dark theme"
    echo "4. Consider switching to iTerm2 for better features"
    echo
    echo "🎨 Recommended Terminal Themes:"
    echo "• Catppuccin: https://github.com/catppuccin/catppuccin"
    echo "• Tokyo Night: https://github.com/tokyo-night/tokyo-night-vscode-theme"
    echo
}

# Create macOS-specific demo
create_macos_demo() {
    cat > demo-macos.sh << 'EOF'
#!/bin/bash

echo "🍎 macOS Neovim + LazyVim + Fish Shell Demo"
echo "=========================================="
echo

# macOS-specific features demo
echo "🌟 macOS-Specific Features:"
echo "1. 🍺 Homebrew integration"
echo "2. 🔤 Native font installation" 
echo "3. 📱 Terminal.app and iTerm2 support"
echo "4. 🛠️ Xcode Command Line Tools integration"
echo "5. 🎯 Apple Silicon (M1/M2) optimized"
echo

# Create a demo file
cat > /tmp/demo-macos.swift << 'SWIFT'
import Foundation
import SwiftUI

// macOS Swift demo showcasing Neovim features
struct ContentView: View {
    @State private var message = "Hello from macOS!"
    
    let features = [
        "Syntax highlighting",
        "Auto-completion",
        "LSP support",
        "Git integration",
        "Beautiful UI"
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            Text(message)
                .font(.largeTitle)
                .foregroundColor(.blue)
            
            List(features, id: \.self) { feature in
                HStack {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.green)
                    Text(feature)
                }
            }
            .frame(height: 200)
        }
        .padding()
    }
}

// TODO: Add more macOS-specific features
// FIXME: Improve SwiftUI integration
// NOTE: This demonstrates Neovim on macOS

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
SWIFT

echo "📋 macOS Demo Commands:"
echo "# Open Swift demo file"
echo "nvim /tmp/demo-macos.swift"
echo
echo "🛠️ macOS Development Commands:"
echo "• 'o .' - Open current directory in Finder"
echo "• 'pbcopy < file.txt' - Copy file to clipboard"
echo "• 'pbpaste > file.txt' - Paste clipboard to file"
echo "• 'brew install package' - Install packages"
echo

read -p "Open macOS demo file in Neovim? (y/N): " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Opening macOS demo file..."
    sleep 1
    nvim /tmp/demo-macos.swift
else
    echo "Demo file created at: /tmp/demo-macos.swift"
fi

echo
echo "🍎 Enjoy your beautiful macOS development environment!"
EOF

    chmod +x demo-macos.sh
}

# Main installation function
main() {
    echo
    read -p "Do you want to proceed with the macOS installation? (y/N): " -n 1 -r
    echo
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Installation cancelled."
        exit 0
    fi
    
    echo
    echo "Starting macOS installation..."
    echo
    
    check_xcode_tools
    install_homebrew
    install_dependencies
    install_starship
    backup_configs
    install_configs
    setup_fish
    setup_neovim
    create_macos_demo
    suggest_terminal_setup
    
    echo
    echo "🎉 macOS installation completed successfully!"
    echo
    echo "📋 Next steps:"
    echo "1. Set your terminal font to 'JetBrainsMono Nerd Font'"
    echo "2. Restart your terminal or run 'exec fish'"
    echo "3. Launch Neovim with 'nvim' to see the beautiful setup"
    echo "4. Try the macOS demo: './demo-macos.sh'"
    echo
    echo "💡 Pro Tips for macOS:"
    echo "• Use iTerm2 for the best terminal experience"
    echo "• Install Homebrew packages for development tools"
    echo "• Use 'o .' to open current directory in Finder"
    echo
    echo "📚 For more information, check the README.md file"
    echo
    echo "Happy coding on macOS! 🍎✨"
}

main "$@"