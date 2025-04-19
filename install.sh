#!/usr/bin/env bash
set -e

VERSION=$(curl -s https://raw.githubusercontent.com/rector-labs/recmev-installer/main/versions/latest.txt)
OS=$(uname | tr '[:upper:]' '[:lower:]')

echo "🔧 Installing recMEV $VERSION for $OS..."

BINARY_URL="https://raw.githubusercontent.com/rector-labs/recmev-installer/main/versions/$VERSION/recmev-${OS}"

curl -L "$BINARY_URL" -o recmev
chmod +x recmev
sudo mv recmev /usr/local/bin/recmev

echo "✅ Installed successfully! Run with: recmev --help"
