#!/usr/bin/env sh
set -e

# Hardcoded version
VERSION="v0.8.1"

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

# Function to ensure ~/.local/bin exists and is in PATH
ensure_local_bin() {
    # Create ~/.local/bin if it doesn't exist
    mkdir -p ~/.local/bin

    # Add to PATH if not already there
    if ! echo "$PATH" | grep -q "$HOME/.local/bin"; then
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
    REPO="RECTOR-LABS/recMEV-installer"
    BASE_URL="https://raw.githubusercontent.com/${REPO}/${VERSION}"

    # Check platform compatibility and set binary name
    check_platform
    
    echo "🔧 Installing recMEV ${VERSION} for $(uname -s)..."

    # Ensure ~/.local/bin exists and is in PATH
    ensure_local_bin

    # Create temporary directory
    TMP_DIR=$(mktemp -d)
    cd "$TMP_DIR"

    # Download files based on installation method
    echo "📥 Downloading recMEV binary..."
    if [ -n "$RECMEV_INSTALLER_LOCAL" ]; then
        # Local development installation
        cp "/Users/rz/Documents/dev/recMEV-installer/$BINARY_NAME" "recmev"
    else
        # Remote installation via curl from GitHub raw content
        curl -L "${BASE_URL}/${BINARY_NAME}" -o "recmev"
    fi

    # Verify download was successful
    if [ ! -s "recmev" ]; then
        echo "❌ Download failed. Please check your internet connection and try again."
        exit 1
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

# Main script execution
do_install