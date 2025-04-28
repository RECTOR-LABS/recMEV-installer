#!/usr/bin/env sh
set -e

# Hardcoded version
VERSION="v0.13.8"

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

    # Create completion directory if it doesn't exist
    COMPLETION_DIR="$HOME/.config/recmev/completion"
    mkdir -p "$COMPLETION_DIR"

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
    echo "To get started:"
    echo "Run: recmev guide       # See beginner's guide"
    echo "Run: recmev --help      # See available commands"
}

# Main script execution
do_install