#!/usr/bin/env bash
set -e

# Function to handle the installation process
do_install() {
    VERSION="master"
    OS=$(uname | tr '[:upper:]' '[:lower:]')
    REPO="RECTOR-LABS/recMEV-installer"

    echo "🔧 Installing recMEV $VERSION for $OS..."

    # Create temporary directory
    TMP_DIR=$(mktemp -d)
    cd "$TMP_DIR"

    # Download files based on installation method
    echo "📥 Downloading recMEV binary..."
    if [ -n "$RECMEV_INSTALLER_LOCAL" ]; then
        # Local development installation
        if [[ "$OS" == "darwin" ]]; then
            cp "/Users/rz/Documents/dev/recMEV-installer/recmev-macos" "recmev"
            cp "/Users/rz/Documents/dev/recMEV-installer/checksums-macos.txt" "checksums-${OS}.txt"
        else
            cp "/Users/rz/Documents/dev/recMEV-installer/recmev-linux" "recmev"
            cp "/Users/rz/Documents/dev/recMEV-installer/checksums-linux.txt" "checksums-${OS}.txt"
        fi
    else
        # Remote installation via curl
        BINARY_NAME="recmev-${OS}"
        CHECKSUM_FILE="checksums-${OS}.txt"
        curl -L "https://raw.githubusercontent.com/${REPO}/${VERSION}/${BINARY_NAME}" -o "recmev"
        curl -L "https://raw.githubusercontent.com/${REPO}/${VERSION}/${CHECKSUM_FILE}" -o "checksums-${OS}.txt"
    fi

    # Verify checksum
    echo "🔒 Verifying checksum..."
    if [[ "$OS" == "darwin" ]]; then
        if ! shasum -a 256 -c "checksums-${OS}.txt"; then
            echo "❌ Checksum verification failed. The binary may be corrupted or tampered with."
            rm -rf "$TMP_DIR"
            exit 1
        fi
    else
        if ! sha256sum -c "checksums-${OS}.txt"; then
            echo "❌ Checksum verification failed. The binary may be corrupted or tampered with."
            rm -rf "$TMP_DIR"
            exit 1
        fi
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
