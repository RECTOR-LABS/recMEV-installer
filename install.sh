#!/usr/bin/env bash
set -e

VERSION="main"
OS=$(uname | tr '[:upper:]' '[:lower:]')

echo "🔧 Installing recMEV $VERSION for $OS..."

# Define URLs
BINARY_URL="https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/$VERSION/recmev-${OS}"
CHECKSUM_URL="https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/$VERSION/checksums-${OS}.txt"

# Download binary and checksum
echo "📥 Downloading recMEV binary..."
curl -fsSL "$BINARY_URL" -o recmev
curl -fsSL "$CHECKSUM_URL" -o "checksums-${OS}.txt"

# Verify checksum
echo "🔒 Verifying checksum..."
if [[ "$OS" == "darwin" ]]; then
    if ! shasum -a 256 -c "checksums-${OS}.txt"; then
        echo "❌ Checksum verification failed. The binary may be corrupted or tampered with."
        rm -f recmev "checksums-${OS}.txt"
        exit 1
    fi
else
    if ! sha256sum -c "checksums-${OS}.txt"; then
        echo "❌ Checksum verification failed. The binary may be corrupted or tampered with."
        rm -f recmev "checksums-${OS}.txt"
        exit 1
    fi
fi

# Install binary
echo "📦 Installing recMEV..."
chmod +x recmev
sudo mv recmev /usr/local/bin/recmev

# Cleanup
rm -f "checksums-${OS}.txt"

echo "✅ Installed successfully! Run 'recmev --help' to get started."
