# recMEV Installer

This repository contains the installation package for recMEV.

## Overview

recMEV installer package provides an automated way to install the recMEV binary on your system. Currently available for:

- macOS
- Linux

The installer places the binary in your user's local binary directory (`~/.local/bin`).

## Components

- `recmev-v0.9.2-mac`: macOS binary
- `recmev-v0.9.2-linux`: Linux binary
- `install.sh`: Installation script with platform detection

## Installation

### Option 1: One-Line Installation (Recommended)

Install recMEV with a single command:

```bash
sh -c "$(curl -sSfL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/v0.9.2/install.sh)"
```

This method will:

- Create ~/.local/bin if it doesn't exist
- Add ~/.local/bin to your PATH (if needed)
- Download and install the appropriate binary for your system

### Option 2: Direct Script Execution

If you've cloned the repository or downloaded the install script:

```bash
./install.sh
```

### Option 3: Manual Installation

For users who prefer to perform the installation steps manually:

```bash
# Create local bin directory if it doesn't exist
mkdir -p ~/.local/bin

# Add to PATH if not already there (add this to your shell's rc file)
export PATH="$HOME/.local/bin:$PATH"

# Download binary (replace OS with either 'linux' or 'mac' based on your system)
curl -fsSL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/v0.9.2/recmev-v0.9.2-OS -o recmev

# Install binary
chmod +x recmev
mv recmev ~/.local/bin/recmev
```

### Installing Specific Versions

To install a specific version of recMEV, you'll need to modify the version number in the installation URL. For example, to install version v0.1.2:

```bash
sh -c "$(curl -sSfL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/v0.5.0/install.sh)"
```

Note on URLs:

- For installation (raw content): Use `https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/VERSION/...`
- For browsing files on GitHub: Use `https://github.com/RECTOR-LABS/recMEV-installer/tree/VERSION`

Available versions:

- v0.9.2 (latest)
- v0.9.1
- v0.9.0
- v0.8.1
- v0.7.1
- v0.6.2
- v0.5.6
- v0.5.5
- v0.5.4
- v0.5.3
- v0.5.1
- v0.5.0
- v0.4.0
- v0.3.5
- v0.3.4
- v0.3.3
- v0.3.2
- v0.3.1
- v0.2.4
- v0.2.3
- v0.2.2
- v0.2.1
- v0.2.0
- v0.1.3
- v0.1.2
- v0.1.1
- v0.1.0

You can find all available versions on our [GitHub releases page](https://github.com/RECTOR-LABS/recMEV-installer/releases).

## Uninstallation

To uninstall recMEV, simply run:

```bash
recmev uninstall
```

This command will remove recMEV from your system.

## Post-Installation Verification

After installation, verify that recMEV was installed correctly:

```bash
recmev --help
```

Note: If you've just added ~/.local/bin to your PATH, you'll need to either:

- Restart your terminal
- Run `source ~/.bashrc` (or `~/.zshrc` for zsh users)

## Security

The installation process includes several security measures:

1. HTTPS downloads from trusted sources
2. Secure temporary directory handling
3. User-space installation (no sudo required)

## Version Information

Current version: v0.9.2

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
   - Ensure ~/.local/bin is in your PATH
   - Try running `echo $PATH` to verify
   - Source your shell's rc file or restart your terminal
   - Try running `which recmev` to locate the binary

## Support

For issues, feature requests, or contributions:

- Open an issue on our [GitHub repository](https://github.com/RECTOR-LABS/recMEV-installer)
- Submit a pull request
- Check existing issues for solutions

## License

MIT
