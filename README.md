# recMEV Installer

This repository contains the installation package for recMEV.

## Overview

recMEV installer package provides an automated way to install the recMEV binary on your system. Currently available for:

- macOS
- Linux

The installer places the binary in the system binary directory (`/usr/local/bin`)

## Components

- `recmev-v0.15.13-mac`: macOS binary
- `recmev-v0.15.13-linux`: Linux binary
- `install.sh`: Installation script with platform detection

## Installation

### Option 1: One-Line Installation (Recommended)

Install recMEV with a single command:

```bash
sh -c "$(curl -sSfL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/master/install.sh)"
```

This method will:

- Create necessary configuration directories
- Download and install the appropriate binary for your system

### Option 2: Direct Script Execution

If you've cloned the repository or downloaded the install script:

```bash
./install.sh
```

### Option 3: Manual Installation

For users who prefer to perform the installation steps manually:

```bash
# Create config directory if it doesn't exist
mkdir -p ~/.config/recmev

# Download binary (replace OS with either 'linux' or 'mac' based on your system)
curl -fsSL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/v0.15.13/recmev-v0.15.13-OS -o recmev

# Install binary
chmod +x recmev
sudo mv recmev /usr/local/bin/recmev
```

### Installing Specific Versions

To install a specific version of recMEV, you'll need to modify the version number in the installation URL. For example, to install version v0.5.0:

```bash
sh -c "$(curl -sSfL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/v0.5.0/install.sh)"
```

Note on URLs:

- For installation (raw content): Use `https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/VERSION/...`
- For browsing files on GitHub: Use `https://github.com/RECTOR-LABS/recMEV-installer/tree/VERSION`

Available versions:

- v0.15.13 (latest) - Enhanced encryption capabilities and improved wallet security
- v0.15.9 - Improved config command and enhanced logging system
- v0.15.7 - Enhanced stability and performance improvements
- v0.15.6 - Enhanced stability and performance improvements
- v0.15.4 - Shell completion support and version management
- v0.13.10 - Enhanced stability and performance improvements
- v0.13.9 - Bug fixes and stability improvements
- v0.13.8 - Bug fixes and stability improvements
- v0.13.5 - Jupiter DEX integration for token swaps
- v0.13.4 - Enhanced DEX integration and performance improvements
- v0.12.0 - Jupiter DEX integration
- v0.11.0 - Pure Rust TLS implementation
- v0.9.4 - Bug fixes and stability improvements
- v0.9.2 - Enhanced error handling and reporting
- v0.9.1 - Transaction optimization
- v0.9.0 - Major performance improvements
- v0.8.1 - Configuration system update
- v0.7.1 - Transaction batch processing
- v0.6.2 - Stability improvements and bug fixes
- v0.5.6 - Blockchain transaction optimizations
- v0.5.5 - Enhanced monitoring capabilities
- v0.5.4 - Config file format updates
- v0.5.3 - Performance improvements for large transactions
- v0.5.1 - CLI enhancement for readability
- v0.5.0 - First stable release with core functionality
- v0.4.0 - Transaction subsystem complete
- v0.3.5 - Transaction signing improvements
- v0.3.4 - Enhanced logging capabilities
- v0.3.3 - Bug fixes and stability improvements
- v0.3.2 - Configuration enhancements
- v0.3.1 - Improved error messages
- v0.2.4 - CLI interface improvements
- v0.2.3 - Bug fixes and performance enhancements
- v0.2.2 - Configuration system updates
- v0.2.1 - Minor bug fixes and improvements
- v0.2.0 - Redesigned architecture
- v0.1.3 - Initial transaction support
- v0.1.2 - Basic CLI functionality
- v0.1.1 - Bug fixes and improvements
- v0.1.0 - Initial alpha release

You can find all available versions on our [GitHub releases page](https://github.com/RECTOR-LABS/recMEV-installer/releases).

## Uninstallation

You can uninstall recMEV using the following commands:

```bash
# Basic uninstallation (keeps logs and config)
recmev uninstall

# Full uninstallation (removes all data including logs and config)
recmev uninstall --all
```

**Platform-specific uninstallation notes:**

- **Both Linux and macOS**: Files in system directories like `/usr/local/bin` require sudo privileges to remove
- The uninstall command will automatically attempt to use sudo if available without password
- If automatic sudo fails, you'll need to use explicit sudo:

```bash
# For Linux and macOS
sudo recmev uninstall --all
```

**macOS note:** On macOS, the system may prompt for your password when attempting to remove files from `/usr/local/bin`. This is normal behavior, as these directories are protected by the system.

### Manual Uninstallation

If you need to manually uninstall recMEV, follow these steps:

1. Remove the binary:

```bash
sudo rm /usr/local/bin/recmev
```

2. Remove configuration files (optional):

```bash
rm -rf ~/.config/recmev
```

3. Remove log files (optional):

```bash
rm -rf ~/.local/share/recmev/logs
```

4. Remove cache files (optional):

```bash
rm -rf ~/.cache/recmev
```

5. Remove shell completions (if installed):

```bash
# Bash
rm ~/.config/recmev/completion/recmev.bash

# Zsh
rm ~/.config/recmev/completion/recmev.zsh

# Fish
rm ~/.config/fish/completions/recmev.fish
```

**Note:** The exact paths may vary slightly depending on your system configuration and installation method.

## Post-Installation Verification

After installation, verify that recMEV was installed correctly:

```bash
recmev --help
```

## Security

The installation process includes several security measures:

1. HTTPS downloads from trusted sources
2. Secure temporary directory handling
3. System-wide installation with proper permissions

## Version Information

Current version: v0.15.13

### New in v0.15.13

- Enhanced encryption capabilities and improved wallet security

## Development

For local development and testing of the installer:

```bash
# Set the local development flag
RECMEV_INSTALLER_LOCAL=1 ./install.sh
```

### Platform Notes

The installer automatically detects your operating system and will:

- Install the appropriate binary for Linux or macOS systems
- Exit with an error on unsupported platforms

## Troubleshooting

Common issues and solutions:

1. Permission denied

   ```bash
   chmod +x ./install.sh  # Make the script executable
   ```

2. Download failed

   - Ensure you have a stable internet connection
   - Try downloading the files again
   - Verify your system is supported (Linux or macOS)

3. Binary not found after installation
   - Ensure /usr/local/bin is in your PATH
   - Try running `echo $PATH` to verify
   - Try running `which recmev` to locate the binary

## Shell Completions

recMEV supports shell completions for Bash, Zsh, and Fish shells. The installer automatically:

1. Generates completion scripts using the `completions` command
2. Stores them in `~/.config/recmev/completion/`
3. Attempts to automatically configure completions for your current shell

### Manual Generation and Setup

You can also manually generate completion scripts using the `completions` command:

```bash
# Generate completions for your preferred shell
recmev completions bash                          # Generate to current directory
recmev completions zsh -o ~/.zsh/completions     # Generate to specific directory
recmev completions fish -o ~/.config/fish/completions
```

If automatic setup fails or if you want to manually enable completions:

#### Bash

Add the following to your `~/.bashrc` or `~/.bash_profile`:

```bash
[ -f ~/.config/recmev/completion/recmev.bash ] && source ~/.config/recmev/completion/recmev.bash
```

#### Zsh

Add the following to your `~/.zshrc`:

```zsh
# Add recmev completions dir to fpath
fpath=(~/.config/recmev/completion $fpath)
autoload -U compinit && compinit
```

#### Fish

Link the completion file to your Fish completions directory:

```fish
ln -sf ~/.config/recmev/completion/recmev.fish ~/.config/fish/completions/recmev.fish
```

### Testing Completions

After enabling completions and restarting your shell (or sourcing your profile), you can test them by typing:

```bash
recmev <TAB>
```

This should display available commands and options.

## Support

For issues, feature requests, or contributions:

- Open an issue on our [GitHub repository](https://github.com/RECTOR-LABS/recMEV-installer)
- Submit a pull request
- Check existing issues for solutions

## License

recMEV Non-Commercial License v1.0. For personal, research, or educational purposes only. See LICENSE file for details.
