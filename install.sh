#!/usr/bin/env bash
set -e

# Function to handle the installation process
do_install() {
    VERSION="master"
    REPO="RECTOR-LABS/recMEV-installer"

    echo "🔧 Installing recMEV $VERSION..."

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
    sudo mv recmev /usr/local/bin/recmev

    # Cleanup
    cd - > /dev/null
    rm -rf "$TMP_DIR"

    echo "✅ Installed successfully! Run 'recmev --help' to get started."
}

# Execute installation
do_install
