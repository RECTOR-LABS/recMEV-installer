# recMEV Installer

This repository contains the installation package for recMEV.

## Overview

recMEV installer package provides an automated way to install the recMEV binary on your system. It is designed for Linux systems.

## Components

- `recmev`: Linux binary
- `install.sh`: Installation script

## Installation

### Option 1: One-Line Installation (Recommended)

Install recMEV with a single command (similar to Solana CLI installation):

```bash
sh -c "$(curl -sSfL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/master/install.sh)"
```

This method will:

- Download the binary
- Install recMEV to your system

### Option 2: Direct Script Execution

If you've cloned the repository or downloaded the install script:

```bash
./install.sh
```

### Option 3: Manual Installation

For users who prefer to perform the installation steps manually:

```bash
# Download binary
curl -fsSL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/master/recmev -o recmev

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

1. HTTPS downloads from trusted sources
2. Secure temporary directory handling
3. Proper permission setting

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

2. Download failed

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
