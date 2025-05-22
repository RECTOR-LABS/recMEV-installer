# recMEV

A CLI tool for executing arbitrage strategies and token swaps on Solana.

## Development Status

For public installation instructions, please refer to [recMEV-installer](https://github.com/RECTOR-LABS/recMEV-installer).

## Features

- CLI interface for executing trades and token swaps
- Jupiter integration for optimal token swaps with customizable parameters
- Real transaction handling with proper signing and confirmation
- Token price lookups and caching via Jupiter API
- Special handling for JUP token trades with optimized parameters
- Improved trade execution with deadline enforcement and profitability checks
- Configurable logging system with JSON formatting
- Automatic updates via GitHub releases
- Solana blockchain integration
- Configuration management for customizing settings
- Pure Rust TLS implementation for improved cross-platform compatibility
- Multi-wallet support with secure wallet management
- Encrypted storage for sensitive information with password protection
- Enhanced user experience with clear help messages and command examples
- Token account management with close functionality
- IPC communication with Python AI engine for trade parameter optimization

## Development Prerequisites

- Rust (latest stable)
- Solana CLI tools
- Python 3.8+ (for AI engine)

## Development Setup

1. Clone the repository with submodules:

```bash
git clone --recursive https://github.com/yourusername/recMEV.git
cd recMEV
```

2. Build the Rust CLI:

```bash
cargo build --release
```

3. Set up Python environment for AI engine (optional):

```bash
conda env create -f environment.yml
conda activate recmev
```

## Architecture

- `src/main.rs`: Entry point with logging setup and command dispatch
- `src/cli.rs`: Command-line interface implementation using clap
- `src/executor.rs`: Trade execution and business logic
- `src/config.rs`: Configuration management with platform-specific paths
- `src/jupiter.rs`: Jupiter DEX integration for token swaps
- `src/ipc.rs`: Inter-process communication with the Python AI engine
- `ai_engine.py`: Python script for AI parameter optimization

## Configuration System

Configuration file locations:

- **Windows**: `%APPDATA%\recmev\config.toml`
- **Unix/Linux/macOS**: `~/.recmev/config.toml`

Development commands:

```bash
# View configuration
recmev config --show

# Modify configuration
recmev config set <key> <value>
```

## Release Process

For release instructions, see [build-and-release-instructions.md](build-and-release-instructions.md).

## Testing

Run the test suite:

```bash
cargo test
```

## License

recMEV Non-Commercial License v1.0. For personal, research, or educational purposes only. See LICENSE file for details.

## Usage

Available Commands:

```bash
# Execute a trade
recmev trade --pair SOL/USDC

# Execute a token swap using Jupiter
recmev wallet swap SOL USDC 0.1
recmev wallet swap <input_token> <output_token> <amount> --slippage 50 --priority-fee 0.000001

# Wallet management
recmev wallet list                  # List all wallets
recmev wallet add <name>            # Add a new wallet (interactive)
recmev wallet add <name> --create-new  # Create a new wallet with generated key
recmev wallet use <name>            # Switch to a different wallet
recmev wallet show                  # Show wallet details and balances
recmev wallet send <recipient> <amount>  # Send SOL to another wallet
recmev wallet export <name>         # Export wallet private key (with security warnings)

# View beginner's guide
recmev guide

# View logs (last 50 lines by default)
recmev logs
recmev logs --lines 100 --verbose

# Generate error report
recmev report                         # Basic error report
recmev report --description "Issue description" --system-info  # Detailed report with system info
recmev report --lines 200            # Include more log lines in report

# Configure settings
recmev config --show                  # Show current configuration
recmev config --log-dir ~/my-logs    # Set custom log directory
recmev config --max-slippage-bps 50  # Set maximum slippage for swaps (in basis points)
recmev config --priority-fee-sol 0.000001  # Set priority fee for transactions (in SOL)

# Update to latest version
recmev update

# Generate shell completions
recmev completions bash             # Generate Bash completions to current directory
recmev completions zsh -o ~/.zsh    # Generate Zsh completions to specified directory
recmev completions fish             # Generate Fish completions

# Uninstall recmev
recmev uninstall                  # Basic uninstall (keeps config and logs)
recmev uninstall --all            # Complete uninstall (removes all files)
sudo recmev uninstall --all       # For system-level files requiring sudo on Linux/macOS
```
