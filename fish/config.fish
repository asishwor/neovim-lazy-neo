# Fish shell configuration
# Initialize starship prompt
starship init fish | source

# Set environment variables
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx TERM xterm-256color

# Add common directories to PATH if they exist
if test -d ~/.local/bin
    fish_add_path ~/.local/bin
end
if test -d ~/.cargo/bin
    fish_add_path ~/.cargo/bin
end

# Aliases for modern tools
alias ll='ls -la'
alias la='ls -la'
alias l='ls -l'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias vim='nvim'
alias vi='nvim'
alias cat='bat --style=plain' 2>/dev/null || alias cat='cat'
alias find='fd' 2>/dev/null || alias find='find'
alias grep='rg' 2>/dev/null || alias grep='grep'

# Git aliases
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph'
alias gd='git diff'

# Development aliases
alias n='nvim'
alias nv='nvim'
alias dev='npm run dev'
alias build='npm run build'
alias start='npm start'

# Function to create and enter directory
function mkcd
    mkdir -p $argv[1] && cd $argv[1]
end

# Function to extract various archive types
function extract
    if test -f $argv[1]
        switch $argv[1]
            case '*.tar.bz2'
                tar xjf $argv[1]
            case '*.tar.gz'
                tar xzf $argv[1]
            case '*.bz2'
                bunzip2 $argv[1]
            case '*.rar'
                unrar x $argv[1]
            case '*.gz'
                gunzip $argv[1]
            case '*.tar'
                tar xf $argv[1]
            case '*.tbz2'
                tar xjf $argv[1]
            case '*.tgz'
                tar xzf $argv[1]
            case '*.zip'
                unzip $argv[1]
            case '*.Z'
                uncompress $argv[1]
            case '*.7z'
                7z x $argv[1]
            case '*'
                echo "'$argv[1]' cannot be extracted via extract()"
        end
    else
        echo "'$argv[1]' is not a valid file"
    end
end

# Disable fish greeting
set fish_greeting

# Enable vi mode
fish_vi_key_bindings

# Set up fzf key bindings if available
if command -v fzf >/dev/null
    fzf_key_bindings
end