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

### Option 1: Using the Installation Script

1. Download and run the installation script:

```bash
curl -fsSL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/main/install.sh | bash
```

### Option 2: Manual Installation

1. Download the appropriate binary for your system:

For macOS:

```bash
curl -fsSL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/main/recmev-macos -o recmev
chmod +x recmev
sudo mv recmev /usr/local/bin/recmev
```

For Linux:

```bash
curl -fsSL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/main/recmev-linux -o recmev
chmod +x recmev
sudo mv recmev /usr/local/bin/recmev
```

## Verifying Installation

Each binary comes with its corresponding checksum file for verification purposes. You can verify the integrity of the binaries using:

For macOS:

```bash
shasum -a 256 -c checksums-macos.txt
```

For Linux:

```bash
sha256sum -c checksums-linux.txt
```

## Usage

After installation, you can verify the installation by running:

```bash
recmev --help
```

## Version

Current version: main

## Notes

- First public release of the recMEV installer
- Includes basic installation functionality
- Verified on Linux and macOS platforms

## License

[Add License Information]

## Support

For issues and feature requests, please visit the [GitHub repository](https://github.com/RECTOR-LABS/recMEV-installer).
