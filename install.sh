#!/usr/bin/env bash
set -e

# Function to ensure ~/.local/bin exists and is in PATH
ensure_local_bin() {
    # Create ~/.local/bin if it doesn't exist
    mkdir -p ~/.local/bin

    # Add to PATH if not already there
    if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
        echo "Adding ~/.local/bin to PATH in your shell profile..."
        
        # Detect shell and update appropriate profile
        SHELL_NAME=$(basename "$SHELL")
        case "$SHELL_NAME" in
            "bash")
                PROFILE_FILE="$HOME/.bashrc"
                ;;
            "zsh")
                PROFILE_FILE="$HOME/.zshrc"
                ;;
            *)
                echo "Warning: Unsupported shell. Please add ~/.local/bin to your PATH manually."
                return
                ;;
        esac
        
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$PROFILE_FILE"
        echo "Please restart your terminal or run 'source $PROFILE_FILE' to update your PATH"
    fi
}

# Function to handle the installation process
do_install() {
    VERSION="master"
    REPO="RECTOR-LABS/recMEV-installer"

    echo "🔧 Installing recMEV $VERSION..."

    # Ensure ~/.local/bin exists and is in PATH
    ensure_local_bin

    # Create temporary directory
    TMP_DIR=$(mktemp -d)
    cd "$TMP_DIR"

    # Download files based on installation method
    echo "📥 Downloading recMEV binary..."
    if [ -n "$RECMEV_INSTALLER_LOCAL" ]; then
        # Local development installation
        cp "/Users/rz/Documents/dev/recMEV-installer/recmev" "recmev"
    else
        # Remote installation via curl
        curl -L "https://raw.githubusercontent.com/${REPO}/${VERSION}/recmev" -o "recmev"
    fi

    # Install binary
    echo "📦 Installing recMEV..."
    chmod +x recmev
    mv recmev ~/.local/bin/recmev

    # Cleanup
    cd - > /dev/null
    rm -rf "$TMP_DIR"

    echo "✅ Installed successfully!"
    echo "NOTE: If this is your first time using ~/.local/bin, you may need to restart your terminal"
    echo "or run 'source ~/.bashrc' (or ~/.zshrc) to use recmev."
    echo "Run 'recmev --help' to get started."
}

# Function to uninstall recMEV
do_uninstall() {
    echo "🗑️  Uninstalling recMEV..."
    if [ -f ~/.local/bin/recmev ]; then
        rm ~/.local/bin/recmev
        echo "✅ recMEV has been uninstalled successfully!"
    else
        echo "❌ recMEV binary not found in ~/.local/bin"
    fi
}

# Main script logic
case "${1:-install}" in
    "install")
        do_install
        ;;
    "uninstall")
        do_uninstall
        ;;
    *)
        echo "Usage: $0 [install|uninstall]"
        exit 1
        ;;
esac
