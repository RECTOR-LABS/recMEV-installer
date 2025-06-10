#!/usr/bin/env sh
set -e

# Define version for download
VERSION="v0.18.21"

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

# Function to display installation information and confirm with user
confirm_installation() {
    echo "📋 recMEV Installation Information"
    echo "=================================="
    echo "You are about to install recMEV ${VERSION}, a high-performance Solana arbitrage engine."
    echo
    echo "This installation will:"
    echo "  • Install recMEV binary to ${INSTALL_DIR}/recmev"
    echo "  • Create configuration directory at $HOME/.recmev"
    echo "  • Set up shell completions for your terminal"
    echo
    echo "The installer requires sudo access to install the binary to ${INSTALL_DIR}."
    echo

    # Prompt for confirmation
    printf "Do you want to proceed with the installation? [y/N] "
    read -r response
    case "$response" in
        [yY][eE][sS]|[yY])
            echo "✅ Proceeding with installation..."
            ;;
        *)
            echo "❌ Installation cancelled."
            exit 1
            ;;
    esac
    echo
}

# Function to ensure installation directory exists
ensure_install_dir() {
    # We'll install to /usr/local/bin which should already exist on most systems
    INSTALL_DIR="/usr/local/bin"
    
    # Create config directory
    mkdir -p "$HOME/.recmev"
}

# Function to install shell completions
install_completions() {
    COMPLETION_DIR="$HOME/.recmev/completion"
    mkdir -p "$COMPLETION_DIR"
    
    # Detect OS for platform-specific handling
    OS="$(uname -s)"
    IS_MACOS=0
    if [ "$OS" = "Darwin" ]; then
        IS_MACOS=1
    fi
    
    # Detect current shell
    CURRENT_SHELL=$(basename "$SHELL")
    
    echo "📥 Generating shell completions..."
    
    # Only generate completions for the current shell
    case "$CURRENT_SHELL" in
        bash)
            echo "Generating Bash completions..."
            "${INSTALL_DIR}/recmev" completions bash -o "$COMPLETION_DIR" && BASH_OK=1 || \
                echo "⚠️  Bash completion generation failed."
            
            if [ -f "$COMPLETION_DIR/recmev.bash" ]; then
                chmod 644 "$COMPLETION_DIR/recmev.bash"
                echo "✅ Bash completions generated successfully."
                COMPLETIONS_AVAILABLE=1
            else
                echo "⚠️  Failed to generate Bash completions."
                COMPLETIONS_AVAILABLE=0
            fi
            ;;
        zsh)
            echo "Generating Zsh completions..."
            "${INSTALL_DIR}/recmev" completions zsh -o "$COMPLETION_DIR" && ZSH_OK=1 || \
                echo "⚠️  Zsh completion generation failed."
            
            if [ -f "$COMPLETION_DIR/_recmev" ]; then
                chmod 644 "$COMPLETION_DIR/_recmev"
                echo "✅ Zsh completions generated successfully."
                COMPLETIONS_AVAILABLE=1
            else
                echo "⚠️  Failed to generate Zsh completions."
                COMPLETIONS_AVAILABLE=0
            fi
            ;;
        fish)
            echo "Generating Fish completions..."
            "${INSTALL_DIR}/recmev" completions fish -o "$COMPLETION_DIR" && FISH_OK=1 || \
                echo "⚠️  Fish completion generation failed."
            
            if [ -f "$COMPLETION_DIR/recmev.fish" ]; then
                chmod 644 "$COMPLETION_DIR/recmev.fish"
                echo "✅ Fish completions generated successfully."
                COMPLETIONS_AVAILABLE=1
            else
                echo "⚠️  Failed to generate Fish completions."
                COMPLETIONS_AVAILABLE=0
            fi
            ;;
        *)
            # For unknown shells, generate all completion types for user to manually set up
            echo "Generating Bash completions..."
            "${INSTALL_DIR}/recmev" completions bash -o "$COMPLETION_DIR" && BASH_OK=1 || true
            
            echo "Generating Zsh completions..."
            "${INSTALL_DIR}/recmev" completions zsh -o "$COMPLETION_DIR" && ZSH_OK=1 || true
            
            echo "Generating Fish completions..."
            "${INSTALL_DIR}/recmev" completions fish -o "$COMPLETION_DIR" && FISH_OK=1 || true
            
            # Check if any completions were generated successfully
            if [ -f "$COMPLETION_DIR/recmev.bash" ] || [ -f "$COMPLETION_DIR/_recmev" ] || [ -f "$COMPLETION_DIR/recmev.fish" ]; then
                echo "✅ Shell completions generated successfully."
                COMPLETIONS_AVAILABLE=1
                chmod 644 "$COMPLETION_DIR"/* 2>/dev/null || true
            else
                echo "⚠️  No shell completions were generated successfully."
                COMPLETIONS_AVAILABLE=0
            fi
            ;;
    esac
    
    # Special note for macOS users
    if [ "$IS_MACOS" = "1" ]; then
        echo ""
        echo "ℹ️  Note for macOS users:"
        echo "  If tab completions don't work after installation,"
        echo "  run this command to fix it:"
        echo "    recmev completions"
        echo ""
    fi
    
    # Provide guidance if completions weren't successful
    if [ "$COMPLETIONS_AVAILABLE" != "1" ]; then
        echo "Troubleshooting:"
        echo "  - After installation completes, run: recmev completions"
        echo "  - This will automatically set up completions for your current shell"
    fi
}

# Function to setup shell completions in user profile
setup_shell_integration() {
    if [ "$COMPLETIONS_AVAILABLE" != "1" ]; then
        return
    fi
    
    CURRENT_SHELL=$(basename "$SHELL")
    COMPLETION_DIR="$HOME/.recmev/completion"
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
                        
                        # Check if bash-completion is configured in .bash_profile
                        if ! grep -q "bash[-_]completion" "$HOME/.bash_profile"; then
                            echo "" >> "$HOME/.bash_profile"
                            echo "# Enable bash completion system if available (macOS)" >> "$HOME/.bash_profile"
                            echo "[ -r \"/usr/local/etc/profile.d/bash_completion.sh\" ] && . \"/usr/local/etc/profile.d/bash_completion.sh\"" >> "$HOME/.bash_profile"
                            echo "[ -r \"/opt/homebrew/etc/profile.d/bash_completion.sh\" ] && . \"/opt/homebrew/etc/profile.d/bash_completion.sh\"" >> "$HOME/.bash_profile"
                            echo "[ -r \"/usr/local/etc/bash_completion\" ] && . \"/usr/local/etc/bash_completion\"" >> "$HOME/.bash_profile"
                            echo "✅ Added bash-completion configuration to ~/.bash_profile (macOS)"
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
                        
                        # Check if bash-completion is configured in .bashrc
                        if ! grep -q "bash[-_]completion" "$HOME/.bashrc"; then
                            echo "" >> "$HOME/.bashrc"
                            echo "# Enable bash completion system if available (macOS)" >> "$HOME/.bashrc"
                            echo "[ -r \"/usr/local/etc/profile.d/bash_completion.sh\" ] && . \"/usr/local/etc/profile.d/bash_completion.sh\"" >> "$HOME/.bashrc"
                            echo "[ -r \"/opt/homebrew/etc/profile.d/bash_completion.sh\" ] && . \"/opt/homebrew/etc/profile.d/bash_completion.sh\"" >> "$HOME/.bashrc"
                            echo "[ -r \"/usr/local/etc/bash_completion\" ] && . \"/usr/local/etc/bash_completion\"" >> "$HOME/.bashrc"
                            echo "✅ Added bash-completion configuration to ~/.bashrc (macOS)"
                        fi
                    else
                        # Create .bash_profile if neither exists
                        echo "# recmev completion" > "$HOME/.bash_profile"
                        echo "[ -f $COMPLETION_DIR/recmev.bash ] && source $COMPLETION_DIR/recmev.bash" >> "$HOME/.bash_profile"
                        echo "" >> "$HOME/.bash_profile"
                        echo "# Enable bash completion system if available (macOS)" >> "$HOME/.bash_profile"
                        echo "[ -r \"/usr/local/etc/profile.d/bash_completion.sh\" ] && . \"/usr/local/etc/profile.d/bash_completion.sh\"" >> "$HOME/.bash_profile"
                        echo "[ -r \"/opt/homebrew/etc/profile.d/bash_completion.sh\" ] && . \"/opt/homebrew/etc/profile.d/bash_completion.sh\"" >> "$HOME/.bash_profile"
                        echo "[ -r \"/usr/local/etc/bash_completion\" ] && . \"/usr/local/etc/bash_completion\"" >> "$HOME/.bash_profile"
                        echo "✅ Created ~/.bash_profile with Bash completion configuration"
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

                # Check if bash-completion is installed on macOS
                if [ "$IS_MACOS" = "1" ]; then
                    # Check if Homebrew is installed
                    if command -v brew >/dev/null 2>&1; then
                        if ! brew list bash-completion >/dev/null 2>&1 && ! brew list bash-completion@2 >/dev/null 2>&1; then
                            echo ""
                            echo "ℹ️  Important: For bash completions to work on macOS, install bash-completion:"
                            echo "   brew install bash-completion"
                            echo ""
                            echo "   After installing, restart your terminal or run:"
                            if [ -f "$HOME/.bash_profile" ]; then
                                echo "   source ~/.bash_profile"
                            else
                                echo "   source ~/.bashrc"
                            fi
                        elif brew list bash-completion@2 >/dev/null 2>&1; then
                            echo "✅ bash-completion@2 is already installed via Homebrew"
                        else
                            echo "✅ bash-completion is already installed via Homebrew"
                        fi
                    else
                        echo ""
                        echo "ℹ️  Note: For full bash completion support on macOS:"
                        echo "   1. Install Homebrew from https://brew.sh"
                        echo "   2. Install bash-completion: brew install bash-completion"
                        echo ""
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
                # Create fish completions directory in .recmev instead of .config/fish
                mkdir -p "$HOME/.recmev/fish/completions"
                
                # Symlink the completion file to .recmev/fish/completions instead of .config/fish/completions
                if [ -f "$COMPLETION_DIR/recmev.fish" ]; then
                    cp "$COMPLETION_DIR/recmev.fish" "$HOME/.recmev/fish/completions/recmev.fish"
                    chmod 644 "$HOME/.recmev/fish/completions/recmev.fish"
                    
                    # We still need to create a symlink in the standard location for fish to find the completions
                    mkdir -p "$HOME/.config/fish/completions"
                    ln -sf "$HOME/.recmev/fish/completions/recmev.fish" "$HOME/.config/fish/completions/recmev.fish"
                    
                    echo "✅ Added Fish completion to ~/.recmev/fish/completions/ (symlinked to ~/.config/fish/completions/)"
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
    echo "  Completion files have been installed to: $HOME/.recmev/completion"
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
                # The symlink to .config/fish/completions should already work,
                # but we'll still mention the config file for consistency
                echo "    source ~/.config/fish/config.fish"
                ;;
        esac
        
        echo ""
        echo "  Or simply restart your terminal."
    else
        echo "  Completions need manual setup. Run this to auto-configure:"
        echo "    recmev completions"
        echo ""
    fi
    
    echo "  To test if completions are working:"
    echo "    1. Type 'recmev' and press Tab twice"
    echo "    2. Type 'recmev config --' and press Tab"
    echo ""
    
    echo "  Troubleshooting tips:"
    if [ "$IS_MACOS" = "1" ]; then
        echo "  • For Bash on macOS: brew install bash-completion"
    else
        echo "  • For Bash on Linux:"
        echo "    sudo apt install bash-completion  # Ubuntu/Debian"
        echo "    sudo dnf install bash-completion  # Fedora/RHEL"
        echo "    sudo pacman -S bash-completion    # Arch Linux"
    fi
    echo "  • For all shells: recmev completions"
    echo "  • More help: https://github.com/RECTOR-LABS/recMEV-installer"
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
    
    # Display installation confirmation prompt
    confirm_installation
    
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
    
    echo "Getting started:"
    echo "  recmev guide       # See beginner's guide"
    echo "  recmev --help      # See available commands"
    
    # Simplified OS-specific notes
    if [ "$(uname -s)" = "Darwin" ]; then
        echo "  recmev completions  # Fix tab completions on macOS"
    else
        echo "  recmev config       # Configure settings"
    fi
    echo
}

# Main script execution
do_install