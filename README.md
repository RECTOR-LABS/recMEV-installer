# recMEV Installer

The official installer for recMEV - the AI-powered trading and wallet management tool for Solana.

## Quick Installation

```bash
curl -sL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/main/install.sh | bash
```

This will download and install the latest version of recMEV on your system.

## Advanced Installation

To install a specific version of recMEV, you'll need to modify the version number in the installation URL. For example, to install version v0.16.3:

```bash
curl -sL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/main/install.sh | VERSION=v0.16.3 bash
```

## Available versions:

- v0.16.3 - Wallet management features and improved author attribution
- v0.16.2 - Wallet commands for token management and SOL operations
- v0.15.14 - Enhanced version management and build improvements
- v0.15.4 - Shell completion support and version management

You can find all available versions on our [GitHub releases page](https://github.com/RECTOR-LABS/recMEV-installer/releases).

Current version: v0.16.3

### New in v0.16.3

- Added author information to Cargo.toml with "RECTOR" as the author
- Improved project metadata and attribution
- Updated from version 0.16.2 to 0.16.3
- Enhanced documentation and project identification

## Uninstalling

To remove recMEV from your system, run:

```bash
recmev uninstall
```

This will remove the recMEV binary and related configuration files.

## More Information

For more details on how to use recMEV, run:

```bash
recmev guide
```

after installation.
