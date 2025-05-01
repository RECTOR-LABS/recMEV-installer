#!/usr/bin/env sh
set -e

# Hardcoded version
VERSION="v0.15.4"

# Check if running on supported platform
check_platform() {
    OS="$(uname -s)"
    
    if [ "$OS" = "Linux" ]; then
        BINARY_NAME="recmev-${VERSION}-linux"
    elif [ "$OS" = "Darwin" ]; then
        BINARY_NAME="recmev-${VERSION}-mac"
    else
        echo "❌ Unsupported operating system. recMEV currently only supports Linux and macOS."
        exit 1
    fi
}

# Function to ensure installation directory exists
ensure_install_dir() {
    # We'll install to /usr/local/bin which should already exist on most systems
    INSTALL_DIR="/usr/local/bin"
    
    # Create config directory
    mkdir -p "$HOME/.config/recmev"
}

# Function to install shell completions
install_completions() {
    COMPLETION_DIR="$HOME/.config/recmev/completion"
    mkdir -p "$COMPLETION_DIR"
    
    echo "📥 Downloading shell completions..."
    
    # Download shell completion scripts
    if [ -n "$RECMEV_INSTALLER_LOCAL" ]; then
        # Local development installation
        if [ -f "./completions/recmev.bash" ]; then
            cp "./completions/recmev.bash" "$COMPLETION_DIR/recmev.bash"
            cp "./completions/recmev.zsh" "$COMPLETION_DIR/_recmev"
            cp "./completions/recmev.fish" "$COMPLETION_DIR/recmev.fish"
        else
            echo "⚠️  Local completion files not found. Shell completions will not be installed."
        fi
    else
        # Remote installation via curl from GitHub
        curl -s -L "${BASE_URL}/completions/recmev.bash" -o "$COMPLETION_DIR/recmev.bash" || \
            echo "⚠️  Bash completion download failed."
        curl -s -L "${BASE_URL}/completions/recmev.zsh" -o "$COMPLETION_DIR/_recmev" || \
            echo "⚠️  Zsh completion download failed."
        curl -s -L "${BASE_URL}/completions/recmev.fish" -o "$COMPLETION_DIR/recmev.fish" || \
            echo "⚠️  Fish completion download failed."
    fi
    
    # Check if any completions were downloaded successfully
    if [ -f "$COMPLETION_DIR/recmev.bash" ] || [ -f "$COMPLETION_DIR/_recmev" ] || [ -f "$COMPLETION_DIR/recmev.fish" ]; then
        echo "✅ Shell completions downloaded successfully."
    fi
}

# Function to setup shell completions in user profile
setup_shell_integration() {
    CURRENT_SHELL=$(basename "$SHELL")
    COMPLETION_DIR="$HOME/.config/recmev/completion"
    
    case "$CURRENT_SHELL" in
        bash)
            if [ -f "$HOME/.bashrc" ]; then
                # Check if completion is already set up
                if ! grep -q "recmev completion" "$HOME/.bashrc"; then
                    echo "" >> "$HOME/.bashrc"
                    echo "# recmev completion" >> "$HOME/.bashrc"
                    echo "[ -f $COMPLETION_DIR/recmev.bash ] && source $COMPLETION_DIR/recmev.bash" >> "$HOME/.bashrc"
                    echo "✅ Added Bash completion to ~/.bashrc"
                fi
            fi
            ;;
        zsh)
            # Create zsh completions directory if it doesn't exist
            mkdir -p "$HOME/.zsh/completion"
            
            # Symlink the completion file
            if [ -f "$COMPLETION_DIR/_recmev" ]; then
                ln -sf "$COMPLETION_DIR/_recmev" "$HOME/.zsh/completion/_recmev"
                
                # Check if fpath includes our directory
                if [ -f "$HOME/.zshrc" ]; then
                    if ! grep -q "recmev completion" "$HOME/.zshrc"; then
                        echo "" >> "$HOME/.zshrc"
                        echo "# recmev completion" >> "$HOME/.zshrc"
                        echo "fpath=($HOME/.zsh/completion \$fpath)" >> "$HOME/.zshrc"
                        echo "autoload -U compinit && compinit" >> "$HOME/.zshrc"
                        echo "✅ Added Zsh completion to ~/.zshrc"
                    fi
                fi
            fi
            ;;
        fish)
            # Create fish completions directory if it doesn't exist
            mkdir -p "$HOME/.config/fish/completions"
            
            # Symlink the completion file
            if [ -f "$COMPLETION_DIR/recmev.fish" ]; then
                ln -sf "$COMPLETION_DIR/recmev.fish" "$HOME/.config/fish/completions/recmev.fish"
                echo "✅ Added Fish completion to ~/.config/fish/completions/"
            fi
            ;;
    esac
}

# Function to print completion setup instructions
print_completion_instructions() {
    echo "🔍 Shell completion setup:"
    echo ""
    echo "  Completion files have been installed to: $HOME/.config/recmev/completion"
    echo ""
    
    case "$(basename "$SHELL")" in
        bash)
            echo "  For Bash, add the following to your ~/.bashrc or ~/.bash_profile:"
            echo "    source $HOME/.config/recmev/completion/recmev.bash"
            ;;
        zsh)
            echo "  For Zsh, add the following to your ~/.zshrc:"
            echo "    fpath=($HOME/.config/recmev/completion \$fpath)"
            echo "    autoload -U compinit && compinit"
            ;;
        fish)
            echo "  For Fish, symlink the completion file:"
            echo "    ln -sf $HOME/.config/recmev/completion/recmev.fish ~/.config/fish/completions/recmev.fish"
            ;;
        *)
            echo "  For Bash: source $HOME/.config/recmev/completion/recmev.bash"
            echo "  For Zsh: Add $HOME/.config/recmev/completion to your fpath"
            echo "  For Fish: Link $HOME/.config/recmev/completion/recmev.fish to ~/.config/fish/completions/"
            ;;
    esac
    
    echo ""
    echo "  Restart your shell or source your profile to enable completions."
}

# Function to display the installation completion banner
display_banner() {
    cat << "EOF"
    ██████  ███████  ██████ ███    ███ ███████ ██    ██
    ██   ██ ██      ██      ████  ████ ██      ██    ██
    ██████  █████   ██      ██ ████ ██ █████   ██    ██
    ██   ██ ██      ██      ██  ██  ██ ██       ██  ██ 
    ██   ██ ███████  ██████ ██      ██ ███████   ████  
                                                      
         High-Performance Solana Arbitrage Engine
                Built by RECTOR with ❤️
EOF
}

# Function to handle the installation process
do_install() {
    REPO="RECTOR-LABS/recMEV-installer"
    BASE_URL="https://raw.githubusercontent.com/${REPO}/${VERSION}"
    INSTALL_DIR="/usr/local/bin"

    # Check platform compatibility and set binary name
    check_platform
    
    # Create directories
    ensure_install_dir
    
    echo "🔧 Installing recMEV ${VERSION} for $(uname -s)..."

    # Use sudo only if not already root
    SUDO=""
    if [ $(id -u) -ne 0 ]; then
        SUDO="sudo"
    fi

    # Create temporary directory
    TMP_DIR=$(mktemp -d)
    cd "$TMP_DIR"

    # Download files based on installation method
    echo "📥 Downloading recMEV components..."
    if [ -n "$RECMEV_INSTALLER_LOCAL" ]; then
        # Local development installation
        cp "./$BINARY_NAME" "recmev"
    else
        # Remote installation via curl from GitHub raw content
        curl -s -L "${BASE_URL}/${BINARY_NAME}" -o "recmev"
    fi

    # Verify downloads were successful
    if [ ! -s "recmev" ]; then
        echo "❌ Download failed. Please check your internet connection and try again."
        exit 1
    fi

    # Install binary
    echo "📦 Installing recMEV components..."
    chmod +x recmev
    $SUDO mv recmev "${INSTALL_DIR}/recmev"

    # Install shell completions
    install_completions
    
    # Attempt to add completions to user's shell config
    setup_shell_integration
    
    # Cleanup
    cd - > /dev/null
    rm -rf "$TMP_DIR"

    # Clear the line
    printf "\033[2K"
    
    # Display completion banner and messages
    echo
    display_banner
    echo
    echo "✨ Installation successful! recMEV ${VERSION} is ready."
    echo
    
    # Print shell completion setup instructions
    print_completion_instructions
    echo
    
    echo "To get started:"
    echo "Run: recmev guide       # See beginner's guide"
    echo "Run: recmev --help      # See available commands"
}

# Main script execution
do_install