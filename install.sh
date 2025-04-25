#!/usr/bin/env sh
set -e

# Hardcoded version
VERSION="v0.9.1"

# Python files directory
PYTHON_DIR="$HOME/.local/lib/recmev"

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
    mkdir -p "$PYTHON_DIR"

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

# Function to check Python installation
check_python() {
    if ! command -v python3 >/dev/null 2>&1; then
        echo "❌ Python 3 is required but not found. Please install Python 3.8 or later."
        exit 1
    fi

    # Check Python version
    PY_VERSION=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    if [ "$(echo "$PY_VERSION" | cut -d. -f1)" -lt 3 ] || [ "$(echo "$PY_VERSION" | cut -d. -f2)" -lt 8 ]; then
        echo "❌ Python 3.8 or later is required. Found version $PY_VERSION"
        exit 1
    fi
}

# Function to install Python dependencies
install_python_deps() {
    echo "📦 Installing Python dependencies..."
    
    # Create virtual environment if it doesn't exist
    if [ ! -d "$PYTHON_DIR/venv" ]; then
        python3 -m venv "$PYTHON_DIR/venv"
    fi
    
    # Activate virtual environment
    . "$PYTHON_DIR/venv/bin/activate"
    
    # Install dependencies
    pip install --upgrade pip
    pip install numpy pandas scikit-learn torch solana anchorpy optuna fastapi uvicorn websockets
    
    deactivate
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

    # Check platform compatibility and set binary name
    check_platform
    
    # Check Python installation
    check_python
    
    echo "🔧 Installing recMEV ${VERSION} for $(uname -s)..."

    # Ensure ~/.local/bin exists and is in PATH
    ensure_local_bin

    # Create temporary directory
    TMP_DIR=$(mktemp -d)
    cd "$TMP_DIR"

    # Download files based on installation method
    echo "📥 Downloading recMEV components..."
    if [ -n "$RECMEV_INSTALLER_LOCAL" ]; then
        # Local development installation
        cp "./$BINARY_NAME" "recmev"
        cp "./ai_engine.py" "ai_engine.py"
    else
        # Remote installation via curl from GitHub raw content
        curl -L "${BASE_URL}/${BINARY_NAME}" -o "recmev"
        curl -L "${BASE_URL}/ai_engine.py" -o "ai_engine.py"
    fi

    # Verify downloads were successful
    if [ ! -s "recmev" ] || [ ! -s "ai_engine.py" ]; then
        echo "❌ Download failed. Please check your internet connection and try again."
        exit 1
    fi

    # Install binary and Python components
    echo "📦 Installing recMEV components..."
    chmod +x recmev
    mv recmev ~/.local/bin/recmev
    mv ai_engine.py "$PYTHON_DIR/"
    
    # Install Python dependencies
    install_python_deps

    # Create launcher script
    cat > ~/.local/bin/recmev-ai << "EOF"
#!/bin/sh
PYTHON_DIR="$HOME/.local/lib/recmev"
. "$PYTHON_DIR/venv/bin/activate"
python3 "$PYTHON_DIR/ai_engine.py" "$@"
EOF
    chmod +x ~/.local/bin/recmev-ai

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
    if ! echo "$PATH" | grep -q "$HOME/.local/bin"; then
        echo "NOTE: You may need to restart your terminal or source your shell profile"
        echo "to use recmev from any directory."
    fi
    echo
    echo "To get started:"
    echo "1. Start the AI engine:    recmev-ai"
    echo "2. In another terminal:    recmev --help"
}

# Main script execution
do_install