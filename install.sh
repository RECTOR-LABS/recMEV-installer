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
            cp "./completions/recmev.bash" "$COMPLETION_DIR/recmev.bash" && BASH_OK=1
            cp "./completions/recmev.zsh" "$COMPLETION_DIR/_recmev" && ZSH_OK=1
            cp "./completions/recmev.fish" "$COMPLETION_DIR/recmev.fish" && FISH_OK=1
        else
            echo "⚠️  Local completion files not found. Shell completions will not be installed."
        fi
    else
        # Remote installation via curl from GitHub
        curl -s -L "${BASE_URL}/completions/recmev.bash" -o "$COMPLETION_DIR/recmev.bash" && BASH_OK=1 || \
            echo "⚠️  Bash completion download failed."
        curl -s -L "${BASE_URL}/completions/recmev.zsh" -o "$COMPLETION_DIR/_recmev" && ZSH_OK=1 || \
            echo "⚠️  Zsh completion download failed."
        curl -s -L "${BASE_URL}/completions/recmev.fish" -o "$COMPLETION_DIR/recmev.fish" && FISH_OK=1 || \
            echo "⚠️  Fish completion download failed."
    fi
    
    # Make sure files have proper permissions
    chmod 644 "$COMPLETION_DIR"/* 2>/dev/null || true
    
    # Check if any completions were downloaded successfully
    if [ -f "$COMPLETION_DIR/recmev.bash" ] || [ -f "$COMPLETION_DIR/_recmev" ] || [ -f "$COMPLETION_DIR/recmev.fish" ]; then
        echo "✅ Shell completions downloaded successfully."
        COMPLETIONS_AVAILABLE=1
    else
        echo "⚠️  No shell completions were downloaded successfully."
        COMPLETIONS_AVAILABLE=0
    fi
}

# Function to setup shell completions in user profile
setup_shell_integration() {
    if [ "$COMPLETIONS_AVAILABLE" != "1" ]; then
        return
    fi
    
    CURRENT_SHELL=$(basename "$SHELL")
    COMPLETION_DIR="$HOME/.config/recmev/completion"
    SHELL_CONFIGURED=0
    
    # Detect macOS for platform-specific handling
    OS="$(uname -s)"
    IS_MACOS=0
    if [ "$OS" = "Darwin" ]; then
        IS_MACOS=1
    fi
    
    echo "🔧 Setting up shell integration for $CURRENT_SHELL..."
    
    case "$CURRENT_SHELL" in
        bash)
            if [ "$BASH_OK" = "1" ]; then
                # On macOS, check both .bashrc and .bash_profile
                if [ "$IS_MACOS" = "1" ]; then
                    # First try .bash_profile which is more common on macOS
                    if [ -f "$HOME/.bash_profile" ]; then
                        if ! grep -q "recmev completion" "$HOME/.bash_profile"; then
                            echo "" >> "$HOME/.bash_profile"
                            echo "# recmev completion" >> "$HOME/.bash_profile"
                            echo "[ -f $COMPLETION_DIR/recmev.bash ] && source $COMPLETION_DIR/recmev.bash" >> "$HOME/.bash_profile"
                            echo "✅ Added Bash completion to ~/.bash_profile"
                            SHELL_CONFIGURED=1
                        else
                            echo "✅ Bash completion already configured in ~/.bash_profile"
                            SHELL_CONFIGURED=1
                        fi
                    elif [ -f "$HOME/.bashrc" ]; then
                        # Fall back to .bashrc if .bash_profile doesn't exist
                        if ! grep -q "recmev completion" "$HOME/.bashrc"; then
                            echo "" >> "$HOME/.bashrc"
                            echo "# recmev completion" >> "$HOME/.bashrc"
                            echo "[ -f $COMPLETION_DIR/recmev.bash ] && source $COMPLETION_DIR/recmev.bash" >> "$HOME/.bashrc"
                            echo "✅ Added Bash completion to ~/.bashrc"
                            SHELL_CONFIGURED=1
                        else
                            echo "✅ Bash completion already configured in ~/.bashrc"
                            SHELL_CONFIGURED=1
                        fi
                    else
                        # Create .bash_profile if neither exists
                        echo "# recmev completion" > "$HOME/.bash_profile"
                        echo "[ -f $COMPLETION_DIR/recmev.bash ] && source $COMPLETION_DIR/recmev.bash" >> "$HOME/.bash_profile"
                        echo "✅ Created ~/.bash_profile with Bash completion"
                        SHELL_CONFIGURED=1
                    fi
                else
                    # On Linux, use .bashrc
                    if [ -f "$HOME/.bashrc" ]; then
                        if ! grep -q "recmev completion" "$HOME/.bashrc"; then
                            echo "" >> "$HOME/.bashrc"
                            echo "# recmev completion" >> "$HOME/.bashrc"
                            echo "[ -f $COMPLETION_DIR/recmev.bash ] && source $COMPLETION_DIR/recmev.bash" >> "$HOME/.bashrc"
                            echo "✅ Added Bash completion to ~/.bashrc"
                            SHELL_CONFIGURED=1
                        else
                            echo "✅ Bash completion already configured in ~/.bashrc"
                            SHELL_CONFIGURED=1
                        fi
                    else
                        # Create .bashrc if it doesn't exist
                        echo "# recmev completion" > "$HOME/.bashrc"
                        echo "[ -f $COMPLETION_DIR/recmev.bash ] && source $COMPLETION_DIR/recmev.bash" >> "$HOME/.bashrc"
                        echo "✅ Created ~/.bashrc with Bash completion"
                        SHELL_CONFIGURED=1
                    fi
                fi

                # Check if bash-completion is installed
                if [ "$IS_MACOS" = "1" ]; then
                    # Check if Homebrew is installed
                    if command -v brew >/dev/null 2>&1; then
                        if ! brew list bash-completion >/dev/null 2>&1; then
                            echo "ℹ️  Tip: For full bash completion support on macOS, install bash-completion:"
                            echo "   brew install bash-completion"
                        fi
                    fi
                fi
            elif [ "$BASH_OK" != "1" ]; then
                echo "⚠️  Bash completion file not available"
            fi
            ;;
        zsh)
            if [ "$ZSH_OK" = "1" ]; then
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
                            SHELL_CONFIGURED=1
                        else
                            echo "✅ Zsh completion already configured in ~/.zshrc"
                            SHELL_CONFIGURED=1
                        fi
                    else
                        # Create .zshrc if it doesn't exist
                        echo "# recmev completion" > "$HOME/.zshrc"
                        echo "fpath=($HOME/.zsh/completion \$fpath)" >> "$HOME/.zshrc"
                        echo "autoload -U compinit && compinit" >> "$HOME/.zshrc"
                        echo "✅ Created ~/.zshrc with Zsh completion"
                        SHELL_CONFIGURED=1
                    fi
                fi
            elif [ "$ZSH_OK" != "1" ]; then
                echo "⚠️  Zsh completion file not available"
            fi
            ;;
        fish)
            if [ "$FISH_OK" = "1" ]; then
                # Create fish completions directory if it doesn't exist
                mkdir -p "$HOME/.config/fish/completions"
                
                # Symlink the completion file
                if [ -f "$COMPLETION_DIR/recmev.fish" ]; then
                    ln -sf "$COMPLETION_DIR/recmev.fish" "$HOME/.config/fish/completions/recmev.fish"
                    echo "✅ Added Fish completion to ~/.config/fish/completions/"
                    SHELL_CONFIGURED=1
                fi
            elif [ "$FISH_OK" != "1" ]; then
                echo "⚠️  Fish completion file not available"
            fi
            ;;
        *)
            echo "⚠️  Unknown shell: $CURRENT_SHELL"
            echo "    Automatic completion setup not available for your shell."
            echo "    See manual instructions below."
            ;;
    esac
    
    if [ "$SHELL_CONFIGURED" = "1" ]; then
        echo "🎉 Shell completions have been configured for $CURRENT_SHELL"
        
        # macOS-specific activation instructions
        if [ "$IS_MACOS" = "1" ]; then
            case "$CURRENT_SHELL" in
                bash)
                    if [ -f "$HOME/.bash_profile" ]; then
                        echo "   Please restart your terminal or run 'source ~/.bash_profile' to activate completions"
                    else
                        echo "   Please restart your terminal or run 'source ~/.bashrc' to activate completions"
                    fi
                    ;;
                *)
                    echo "   Please restart your terminal or run 'source ~/.${CURRENT_SHELL}rc' to activate completions"
                    ;;
            esac
        else
            echo "   Please restart your terminal or run 'source ~/.${CURRENT_SHELL}rc' to activate completions"
        fi
    fi
}

# Function to print completion setup instructions
print_completion_instructions() {
    if [ "$COMPLETIONS_AVAILABLE" != "1" ]; then
        echo "🔍 Shell completion files not available."
        return
    fi
    
    # Detect macOS for platform-specific instructions
    OS="$(uname -s)"
    IS_MACOS=0
    if [ "$OS" = "Darwin" ]; then
        IS_MACOS=1
    fi
    
    echo "🔍 Shell completion setup:"
    echo ""
    echo "  Completion files have been installed to: $HOME/.config/recmev/completion"
    echo ""
    
    if [ "$SHELL_CONFIGURED" = "1" ]; then
        echo "  ✅ Your shell has been automatically configured for completions."
        echo "  To activate them now, run:"
        
        case "$(basename "$SHELL")" in
            bash)
                if [ "$IS_MACOS" = "1" ] && [ -f "$HOME/.bash_profile" ]; then
                    echo "    source ~/.bash_profile"
                else
                    echo "    source ~/.bashrc"
                fi
                ;;
            zsh)
                echo "    source ~/.zshrc"
                ;;
            fish)
                echo "    source ~/.config/fish/config.fish"
                ;;
        esac
        
        echo ""
        echo "  Or simply restart your terminal."
        echo ""
        echo "  To test if completions are working:"
        echo "    1. Type 'recmev' and press Tab twice (should show available commands)"
        echo "    2. Type 'recmev install -' and press Tab (should show --version and --list options)"
    else
        echo "  Manual setup instructions:"
        echo ""
        if [ "$BASH_OK" = "1" ]; then
            if [ "$IS_MACOS" = "1" ]; then
                echo "  • For Bash on macOS, add the following to your ~/.bash_profile:"
            else
                echo "  • For Bash, add the following to your ~/.bashrc:"
            fi
            echo "      source $HOME/.config/recmev/completion/recmev.bash"
        fi
        
        if [ "$ZSH_OK" = "1" ]; then
            echo "  • For Zsh, add the following to your ~/.zshrc:"
            echo "      fpath=($HOME/.config/recmev/completion \$fpath)"
            echo "      autoload -U compinit && compinit"
        fi
        
        if [ "$FISH_OK" = "1" ]; then
            echo "  • For Fish, symlink the completion file:"
            echo "      ln -sf $HOME/.config/recmev/completion/recmev.fish ~/.config/fish/completions/recmev.fish"
        fi
        
        echo ""
        echo "  After configuration, restart your shell or source your profile to enable completions."
    fi
    
    echo ""
    echo "  Troubleshooting tips:"
    echo "  • If completions don't work, ensure your shell's completion system is enabled"
    
    # macOS-specific troubleshooting tips
    if [ "$IS_MACOS" = "1" ]; then
        echo "  • On macOS with Bash, you need the bash-completion package installed:"
        echo "    brew install bash-completion"
        echo "  • On macOS with Zsh (default since Catalina), completions should work out of the box"
    else
        echo "  • For Bash on Linux, you may need to install the bash-completion package:"
        echo "    apt install bash-completion  # Ubuntu/Debian"
        echo "    dnf install bash-completion  # Fedora/RHEL"
    fi
    
    echo "  • For more help, visit: https://github.com/RECTOR-LABS/recMEV-installer"
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