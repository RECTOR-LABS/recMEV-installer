# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with the recMEV installer repository.

## Repository Purpose

The recMEV installer repository serves as the public distribution point for the recMEV CLI application. It contains installation scripts, pre-compiled binaries, and version management tools for cross-platform deployment.

### Key Components
- **Installation Scripts**: Cross-platform installation automation
- **Binary Distribution**: Pre-compiled Linux and macOS binaries
- **Version Management**: Version tracking and changelog management
- **Documentation**: Installation guides and troubleshooting

### Core Features
- **Cross-Platform Support**: Linux (x86_64) and macOS (ARM64) binaries
- **Automated Installation**: Simple one-line installation process
- **Version Tracking**: Semantic versioning with changelog
- **License Management**: MIT license distribution

## Repository Structure

### Essential Files
- `install.sh` - Main installation script
- `recmev-v{version}-linux` - Linux binary (x86_64)
- `recmev-v{version}-mac` - macOS binary (ARM64)
- `recmev-version.txt` - Current version information
- `recmev-CHANGELOG.md` - Version history and changes
- `README.md` - Installation instructions
- `LICENSE` - MIT license

### Binary Naming Convention
```
recmev-v{MAJOR}.{MINOR}.{PATCH}-{PLATFORM}
```
Examples:
- `recmev-v0.19.1-linux`
- `recmev-v0.19.1-mac`

## Development Guidelines

### Binary Updates
When new binaries are built from the main application:
1. Binaries are automatically copied from `recMEV/target/` during build
2. Version numbers are extracted from `recMEV/Cargo.toml`
3. File naming follows the established convention

### Installation Script Maintenance
- Keep `install.sh` compatible with both Linux and macOS
- Implement proper error handling and user feedback
- Support installation to standard system paths
- Provide uninstall capabilities

### Version Management
- Update `recmev-version.txt` with each release
- Maintain comprehensive changelog in `recmev-CHANGELOG.md`
- Follow semantic versioning principles
- Document breaking changes clearly

## Installation Process

### User Installation
```bash
# One-line installation
curl -sSL https://raw.githubusercontent.com/[repo]/recMEV-installer/main/install.sh | bash

# Manual installation
wget https://raw.githubusercontent.com/[repo]/recMEV-installer/main/install.sh
chmod +x install.sh
./install.sh
```

### Installation Script Logic
1. Detect operating system and architecture
2. Download appropriate binary
3. Verify binary integrity
4. Install to system PATH
5. Set proper permissions
6. Provide user feedback

## Development Patterns

### Binary Distribution
- Binaries are built and copied from the main `recMEV/` application
- Use the Makefile targets in `recMEV/` for building
- Verify binary functionality before distribution

### Script Updates
- Test installation scripts on both Linux and macOS
- Implement proper error handling
- Provide clear user feedback
- Support both interactive and non-interactive modes

### Documentation
- Keep README.md current with installation instructions
- Document system requirements
- Provide troubleshooting guidance
- Include usage examples

## Testing Requirements

### Installation Testing
```bash
# Test installation script
./install.sh

# Verify installation
which recmev
recmev --version
recmev --help
```

### Cross-Platform Testing
- Test on various Linux distributions
- Test on macOS (ARM64)
- Verify binary compatibility
- Test installation in different environments

### Binary Verification
```bash
# Check binary signatures
file recmev-v{version}-linux
file recmev-v{version}-mac

# Test binary execution
./recmev-v{version}-linux --version
./recmev-v{version}-mac --version
```

## Distribution Guidelines

### Binary Updates
1. Build binaries using `make build` in `recMEV/`
2. Binaries are automatically copied to this repository
3. Update version tracking files
4. Test installation process
5. Update changelog

### Release Process
1. Update version in `recmev-version.txt`
2. Update `recmev-CHANGELOG.md`
3. Test installation script
4. Verify binary functionality
5. Tag release if using git tags

## Security Considerations

### Binary Integrity
- Verify binary signatures before distribution
- Use checksums for binary verification
- Implement secure download mechanisms
- Document security best practices

### Installation Security
- Use HTTPS for all downloads
- Verify script integrity
- Implement proper permission handling
- Provide security warnings as needed

## Troubleshooting

### Common Issues
- Permission denied errors
- PATH configuration issues
- Binary compatibility problems
- Network connectivity issues

### Debugging
- Enable verbose output in installation script
- Check system logs for errors
- Verify system requirements
- Test binary compatibility

## User Support

### Documentation
- Provide clear installation instructions
- Document system requirements
- Include troubleshooting guides
- Maintain FAQ section

### Error Handling
- Implement comprehensive error messages
- Provide solution suggestions
- Include contact information
- Support issue reporting

## Cross-References

For build processes and binary generation, see:
- Main application: [../recMEV/CLAUDE.md](../recMEV/CLAUDE.md)
- Repository coordination: [../CLAUDE.md](../CLAUDE.md)