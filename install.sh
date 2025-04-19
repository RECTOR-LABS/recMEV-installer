#!/usr/bin/env bash
set -e

VERSION="master"
OS=$(uname | tr '[:upper:]' '[:lower:]')
REPO="RECTOR-LABS/recMEV-installer"

echo "🔧 Installing recMEV $VERSION for $OS..."

# Define URLs
BINARY_URL="https://raw.githubusercontent.com/$REPO/$VERSION/recmev-${OS}"
CHECKSUM_URL="https://raw.githubusercontent.com/$REPO/$VERSION/checksums-${OS}.txt"

# Create temporary directory
TMP_DIR=$(mktemp -d)
cd "$TMP_DIR"

# Download binary and checksum
echo "📥 Downloading recMEV binary..."
if ! curl -fsSL "$BINARY_URL" -o "recmev"; then
    echo "❌ Failed to download binary. Please check your internet connection and try again."
    rm -rf "$TMP_DIR"
    exit 1
fi

if ! curl -fsSL "$CHECKSUM_URL" -o "checksums-${OS}.txt"; then
    echo "❌ Failed to download checksum file. Please check your internet connection and try again."
    rm -rf "$TMP_DIR"
    exit 1
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
