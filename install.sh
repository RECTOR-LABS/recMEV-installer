#!/bin/bash
set -e

# Hardcoded version
VERSION="${VERSION:-v0.16.3}"
VERSION_NUMBER="${VERSION#v}"

# Colors for formatting
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Print banner
echo -e "${GREEN}${BOLD}"
echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo "┃                            recMEV Installer                                ┃"
echo "┃                                                                            ┃"
echo "┃  Installing recMEV version ${VERSION_NUMBER}                                          ┃"
echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
echo -e "${NC}"

# Detect OS
OS="$(uname -s)"
case "${OS}" in
    Linux*)     PLATFORM=linux;;
    Darwin*)    PLATFORM=mac;;
    *)          echo -e "${RED}Unsupported platform: ${OS}${NC}" && exit 1;;
esac

echo -e "${BLUE}Detected platform: ${PLATFORM}${NC}"

# Create directories
echo -e "${YELLOW}Creating configuration directories...${NC}"
mkdir -p ~/.config/recmev
mkdir -p ~/.config/recmev/completion
mkdir -p ~/.local/share/recmev/logs
mkdir -p ~/.cache/recmev

# Set binary URL
BINARY_URL="https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/${VERSION}/recmev-${VERSION_NUMBER}-${PLATFORM}"
echo -e "${BLUE}Downloading recMEV binary from:${NC}"
echo -e "${YELLOW}${BINARY_URL}${NC}"

# Download binary
echo -e "${YELLOW}Downloading recMEV...${NC}"
TMP_DIR=$(mktemp -d)
curl -sSL "${BINARY_URL}" -o "${TMP_DIR}/recmev"
chmod +x "${TMP_DIR}/recmev"

# Install binary
echo -e "${YELLOW}Installing recMEV...${NC}"
sudo mv "${TMP_DIR}/recmev" /usr/local/bin/recmev

# Clean up
rm -rf "${TMP_DIR}"

# Verify installation
echo -e "${YELLOW}Verifying installation...${NC}"
INSTALLED_VERSION=$(recmev version 2>&1)
echo -e "${GREEN}Successfully installed recMEV version ${INSTALLED_VERSION}${NC}"

# Generate shell completions
echo -e "${YELLOW}Setting up shell completions...${NC}"
recmev completions bash -o ~/.config/recmev/completion/
recmev completions zsh -o ~/.config/recmev/completion/
mkdir -p ~/.config/fish/completions/
recmev completions fish -o ~/.config/fish/completions/

# Detect current shell
CURRENT_SHELL=$(basename "$SHELL")
echo -e "${BLUE}Detected shell: ${CURRENT_SHELL}${NC}"

# Configure shell completions
case "${CURRENT_SHELL}" in
    bash)
        PROFILE_FILE="$HOME/.bashrc"
        echo -e "${YELLOW}Adding bash completions to ${PROFILE_FILE}${NC}"
        echo '[ -f ~/.config/recmev/completion/recmev.bash ] && source ~/.config/recmev/completion/recmev.bash' >> "${PROFILE_FILE}"
        ;;
    zsh)
        PROFILE_FILE="$HOME/.zshrc"
        echo -e "${YELLOW}Adding zsh completions to ${PROFILE_FILE}${NC}"
        echo 'fpath=(~/.config/recmev/completion $fpath)' >> "${PROFILE_FILE}"
        echo 'autoload -U compinit && compinit' >> "${PROFILE_FILE}"
        ;;
    fish)
        echo -e "${YELLOW}Fish completions should be automatically available${NC}"
        ;;
    *)
        echo -e "${YELLOW}Shell completions for ${CURRENT_SHELL} are not automatically configured.${NC}"
        echo -e "${YELLOW}Please set up shell completions manually.${NC}"
        ;;
esac

echo -e "${GREEN}${BOLD}"
echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo "┃                           Installation Complete                            ┃"
echo "┃                                                                            ┃"
echo "┃  Get started with:                                                         ┃"
echo "┃                                                                            ┃"
echo "┃  $ recmev guide              Show a guide to using recMEV                  ┃"
echo "┃  $ recmev config             Configure your settings                       ┃"
echo "┃  $ recmev wallet show        Check your wallet balance                     ┃"
echo "┃                                                                            ┃"
echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
echo -e "${NC}"

exit 0