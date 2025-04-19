#!/usr/bin/env bash
set -e

VERSION="master"
OS=$(uname | tr '[:upper:]' '[:lower:]')
REPO="RECTOR-LABS/recMEV-installer"

echo "🔧 Installing recMEV $VERSION for $OS..."

# Create temporary directory
TMP_DIR=$(mktemp -d)
cd "$TMP_DIR"

# Download files directly from the repository
echo "📥 Downloading recMEV binary..."
if [[ "$OS" == "darwin" ]]; then
    cp "/Users/rz/Documents/dev/recMEV-installer/recmev-macos" "recmev"
    cp "/Users/rz/Documents/dev/recMEV-installer/checksums-macos.txt" "checksums-${OS}.txt"
else
    cp "/Users/rz/Documents/dev/recMEV-installer/recmev-linux" "recmev"
    cp "/Users/rz/Documents/dev/recMEV-installer/checksums-linux.txt" "checksums-${OS}.txt"
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
