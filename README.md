# recMEV Installer

This repository contains the installation package for recMEV.

## Overview

recMEV installer package provides an automated way to install the recMEV binary on your system. Currently available for:

- macOS
- Linux (Coming Soon!)

The installer places the binary in your user's local binary directory (`~/.local/bin`).

## Components

- `recmev`: macOS binary (Linux version coming soon)
- `install.sh`: Installation script with platform detection

## Installation

### Option 1: One-Line Installation (Recommended)

Install recMEV with a single command:

```bash
sh -c "$(curl -sSfL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/master/install.sh)"
```

This method will:

- Create ~/.local/bin if it doesn't exist
- Add ~/.local/bin to your PATH (if needed)
- Download and install the binary

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

# Download binary
curl -fsSL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/master/recmev -o recmev

# Install binary
chmod +x recmev
mv recmev ~/.local/bin/recmev
```

## Uninstallation

To uninstall recMEV, you can use either of these methods:

```bash
# Method 1: Using the install script
./install.sh uninstall

# Method 2: Manual removal
rm ~/.local/bin/recmev
```

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

Current version: master

## Development

For local development and testing of the installer:

```bash
# Set the local development flag
RECMEV_INSTALLER_LOCAL=1 ./install.sh
```

### Platform Notes

The installer automatically detects your operating system and will:

- Proceed with installation on macOS
- Show a friendly message about upcoming Linux support on Linux systems
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
   - Verify you're using the correct version

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
