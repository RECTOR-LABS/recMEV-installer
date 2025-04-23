# recMEV

A CLI tool for executing arbitrage strategies on Solana, with AI-powered parameter optimization.

## Features

- CLI interface for executing trades with AI-optimized parameters
- Configurable logging system with JSON formatting
- Automatic updates via GitHub releases
- IPC communication between Rust and Python components
- Solana blockchain integration
- Configuration management for customizing settings

## Prerequisites

- Rust (latest stable)
- Python 3.8+
- Solana CLI tools

## Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/recMEV.git
cd recMEV
```

2. Build the Rust CLI:

```bash
cargo build --release
```

Current version: 0.5.1

## Usage

1. Start the AI engine:

```bash
python ai_engine.py
```

2. Available Commands:

```bash
# Execute a trade
recmev trade --pair SOL/USDC

# View logs (last 50 lines by default)
recmev logs
recmev logs --lines 100 --verbose

# Configure settings
recmev config --show                  # Show current configuration
recmev config --log-dir ~/my-logs    # Set custom log directory

# Update to latest version
recmev update

# Uninstall recmev
recmev uninstall
```

Example log output:

```
==================== recMEV Logs ====================
TIMESTAMP               LEVEL  COMPONENT           MESSAGE
2024-03-21 10:30:15    INFO   executor           Starting trade execution
2024-03-21 10:30:16    INFO   ipc               Connected to AI engine
2024-03-21 10:30:17    INFO   executor           Trade completed successfully
```

## Architecture

- `src/cli.rs`: Command-line interface implementation
- `src/executor.rs`: Trade execution logic
- `src/ipc.rs`: Inter-process communication with AI engine
- `src/config.rs`: Configuration management
- `ai_engine.py`: Python server for trade parameter optimization

## License

MIT
