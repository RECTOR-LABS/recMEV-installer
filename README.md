# recMEV Installer

This repository contains the installation package for recMEV, providing support for both Linux and macOS platforms.

## Overview

recMEV installer package provides an automated way to install the recMEV binary on your system. It supports both Linux and macOS platforms with pre-compiled binaries and verification checksums.

## Components

- `recmev-linux`: Linux binary
- `recmev-macos`: macOS binary
- `install.sh`: Installation script
- `checksums-linux.txt`: SHA256 checksums for Linux binary
- `checksums-macos.txt`: SHA256 checksums for macOS binary

## Installation

### Option 1: One-Line Installation (Recommended)

Install recMEV with a single command (similar to Solana CLI installation):

```bash
sh -c "$(curl -sSfL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/master/install.sh)"
```

This method will:

- Automatically detect your operating system
- Download the appropriate binary
- Verify the checksum
- Install recMEV to your system

### Option 2: Direct Script Execution

If you've cloned the repository or downloaded the install script:

```bash
./install.sh
```

### Option 3: Manual Installation

For users who prefer to perform the installation steps manually:

For macOS:

```bash
# Download binary and checksum
curl -fsSL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/master/recmev-macos -o recmev
curl -fsSL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/master/checksums-macos.txt -o checksums-macos.txt

# Verify checksum
shasum -a 256 -c checksums-macos.txt

# Install binary
chmod +x recmev
sudo mv recmev /usr/local/bin/recmev
```

For Linux:

```bash
# Download binary and checksum
curl -fsSL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/master/recmev-linux -o recmev
curl -fsSL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/master/checksums-linux.txt -o checksums-linux.txt

# Verify checksum
sha256sum -c checksums-linux.txt

# Install binary
chmod +x recmev
sudo mv recmev /usr/local/bin/recmev
```

## Post-Installation Verification

After installation, verify that recMEV was installed correctly:

```bash
recmev --help
```

## Security

The installation process includes several security measures:

1. Checksum verification of binaries
2. HTTPS downloads from trusted sources
3. Secure temporary directory handling
4. Proper permission setting

## Version Information

Current version: master

## Development

For local development and testing of the installer:

```bash
# Set the local development flag
RECMEV_INSTALLER_LOCAL=1 ./install.sh
```

## Troubleshooting

Common issues and solutions:

1. Permission denied

   ```bash
   sudo chmod +x ./install.sh  # Make the script executable
   ```

2. Checksum verification failed

   - Ensure you have a stable internet connection
   - Try downloading the files again
   - Verify you're using the correct version

3. Binary not found after installation
   - Ensure `/usr/local/bin` is in your PATH
   - Try running `which recmev` to locate the binary

## Support

For issues, feature requests, or contributions:

- Open an issue on our [GitHub repository](https://github.com/RECTOR-LABS/recMEV-installer)
- Submit a pull request
- Check existing issues for solutions

## License

[Add License Information]
