#!/bin/bash

# Demo script to showcase Neovim + LazyVim + Fish Shell setup
# Run this after installation to see the features in action

echo "🎨 Neovim + LazyVim + Fish Shell Demo"
echo "===================================="
echo

# Check if setup is installed
if ! command -v nvim &> /dev/null; then
    echo "❌ Neovim not found. Please run ./install.sh first"
    exit 1
fi

if ! command -v fish &> /dev/null; then
    echo "❌ Fish shell not found. Please run ./install.sh first"
    exit 1
fi

echo "✅ Setup verification complete!"
echo

# Create a demo file for testing
cat > /tmp/demo.js << 'EOF'
// Demo file showcasing Neovim features
const greetings = {
  english: "Hello, World!",
  spanish: "¡Hola, Mundo!",
  french: "Bonjour, le Monde!",
  japanese: "こんにちは世界！"
};

function displayGreetings() {
  Object.entries(greetings).forEach(([lang, greeting]) => {
    console.log(`${lang.toUpperCase()}: ${greeting}`);
  });
}

// TODO: Add more languages
// FIXME: Handle special characters better
// NOTE: This is a demo file

class DemoClass {
  constructor(name) {
    this.name = name;
    this.features = [
      "Syntax highlighting",
      "Auto-completion", 
      "Git integration",
      "Beautiful UI",
      "LSP support"
    ];
  }
  
  showFeatures() {
    console.log(`Features of ${this.name}:`);
    this.features.forEach((feature, index) => {
      console.log(`  ${index + 1}. ${feature}`);
    });
  }
}

const nvimDemo = new DemoClass("LazyVim Setup");
nvimDemo.showFeatures();
displayGreetings();

export default { greetings, displayGreetings, DemoClass };
EOF

echo "🌟 Demo Features:"
echo "1. 🎨 Beautiful Catppuccin theme"
echo "2. 📊 Alpha dashboard with ASCII art"
echo "3. 🔍 Telescope fuzzy finder"
echo "4. 🌳 File explorer"
echo "5. ⚡ Auto-completion"
echo "6. 🎯 Syntax highlighting"
echo "7. 📝 Git integration"
echo "8. 🖥️  Integrated terminal"
echo

echo "📋 Quick Demo Commands:"
echo "# Open demo file with Neovim"
echo "nvim /tmp/demo.js"
echo
echo "# Key shortcuts to try:"
echo "• <space>ff - Find files"
echo "• <space>e  - File explorer"
echo "• <space>gg - Git status"
echo "• Ctrl-\\   - Toggle terminal"
echo "• <space>/  - Search in file"
echo "• gd        - Go to definition"
echo

echo "🐚 Fish Shell Features:"
echo "# Try these commands in Fish shell:"
echo "fish -c 'echo \"Intelligent autosuggestions and syntax highlighting!\"'"
echo "fish -c 'ls -la | head -5'"
echo "fish -c 'git status 2>/dev/null || echo \"No git repo in current directory\"'"
echo

echo "⭐ Starship Prompt:"
echo "# Your prompt shows:"
echo "• Current directory"
echo "• Git branch and status"
echo "• Language versions"
echo "• Command duration"
echo

# Ask if user wants to open the demo file
echo "🚀 Ready to explore?"
read -p "Open demo file in Neovim now? (y/N): " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Opening demo file in Neovim..."
    echo "Try the shortcuts mentioned above!"
    sleep 2
    nvim /tmp/demo.js
else
    echo "Demo file created at: /tmp/demo.js"
    echo "Open it manually with: nvim /tmp/demo.js"
fi

echo
echo "🎉 Enjoy your beautiful development environment!"
echo "📚 For more info, check: https://github.com/asishwor/neovim-lazy-neo"