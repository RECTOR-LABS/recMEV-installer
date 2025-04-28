# Full Changelog

## [0.13.5]

### Added

- Jupiter DEX integration for token swaps
- New `swap` command for executing token swaps
- Configuration options for Jupiter swap parameters
- Enhanced config command with Jupiter swap settings

### Changed

- Improved config output display with better organization
- Updated configuration storage with Jupiter DEX settings
- Enhanced documentation to reflect new features

### Fixed

- Various bug fixes and stability improvements
- Fixed configuration save logic

## [0.13.4]

### Added

- New features for improved DEX integration
- Enhanced error handling for network transactions

### Changed

- Optimized transaction submission process
- Updated documentation with latest commands
- Improved logging for better debugging

### Fixed

- Various bug fixes and performance improvements
- Fixed cross-platform compatibility issues

## [0.12.0]

### Added

- Jupiter DEX integration for token swaps with `recmev swap` command
- New configuration options for customizing swap parameters:
  - Max slippage (in basis points)
  - Priority fee type and amount
  - Dynamic compute limit and slippage options
- Enhanced configuration command with support for Jupiter parameters
- Complete documentation for new swap functionality

### Changed

- Improved configuration system to support nested configuration sections
- Updated help text to include Jupiter swap parameters
- Enhanced error handling for invalid configuration values
- Updated README with new commands and examples

### Fixed

- Various minor bug fixes and code improvements

## [0.11.0]

### Added

- Pure Rust TLS implementation using rustls-tls
- New 'Guide' command for beginner-friendly instructions
- New 'About' command with detailed product information
- Improved text formatting with textwrap for better readability
- Enhanced UI with ASCII banner and framed text displays

### Changed

- Modified reqwest dependency to use rustls-tls instead of OpenSSL
- Improved cross-compilation support by removing native dependencies
- Updated Cargo.toml dependencies with more flexible version requirements
- Improved README.md with documentation for new guide command
- Enhanced CLI commands with better organization
- Restructured dependency specifications for better maintainability

### Fixed

- Resolved OpenSSL dependency issues during Linux builds
- Documentation consistency across repositories
- Command-line interface help messages and descriptions

### Removed

- Specific version pinning for most dependencies in favor of more flexible requirements

## [0.9.4]

### Added

- Enhanced build process documentation
- Improved release verification checks

### Changed

- Removed AI engine components
- Simplified build process and dependencies
- Updated documentation to reflect core functionality
- Streamlined Makefile by removing Python-related tasks

### Fixed

- Documentation consistency across repositories
- Build process verification checks

### Removed

- AI engine components and dependencies
- Python dependency requirements
- IPC communication between Rust and Python components

## [0.9.2]

### Added

- Version update to 0.9.2
- Additional build process documentation

### Changed

- Improved version management in build process
- Enhanced documentation consistency across repositories

### Fixed

- Version consistency between documentation and code
- Build process verification checks

## [0.9.1]

### Added

- Automated cleanup of old binary versions during release process
- Enhanced local development installation path handling

### Changed

- Improved release process documentation with explicit version cleanup steps
- Updated build system to ensure consistent versioning across all components

### Fixed

- Version consistency between Cargo.toml and binary output
- Installation script local development path handling

## [0.9.0]

### Added

- Enhanced AI engine with confidence scoring for trade parameters
- New parameter validation in trade execution
- Additional trade parameters: confidence_score, max_price_impact, execution_deadline
- Minimum profit threshold implementation for trade validation
- Python file copying to installer directory during build process

### Changed

- Improved Makefile with verification step for build artifacts
- Enhanced AI parameter documentation in Python code
- Better error handling with specific rejection reasons in executor
- Extended trade parameter struct with new fields for risk management

### Fixed

- Build process to include Python files required for execution
- Error handling in trade execution
- Validation logic for parameter boundaries

### Removed

- Deprecated validation methods in executor logic

## [0.8.1]

### Added

- New 'report' command for generating error reports and system diagnostics
- System information collection in error reports
- Automatic log collection in error reports
- Report ID generation for better tracking

### Changed

- Improved CLI help message generation using Clap's built-in functionality
- Enhanced error reporting workflow
- Better organization of CLI command structure

### Fixed

- Command-line help message formatting
- CLI command organization and structure

### Removed

- Custom help message generation code in favor of Clap's built-in functionality

## [0.7.1]

### Added

- New configuration system using TOML format
- Enhanced uninstall command with --all flag for clean uninstallation
- Improved error handling and context in configuration operations
- Better user feedback during configuration initialization

### Changed

- Migrated from config.env to config.toml format
- Restructured configuration with nested configs for better organization
- Enhanced logging output with file locations
- Improved error messages and user guidance

### Fixed

- Configuration file handling and creation
- Error handling in configuration operations
- Log directory creation issues

### Removed

- Legacy config.env support
- Deprecated configuration methods

## [0.6.2]

### Added

- Platform-specific configuration file locations
- Enhanced configuration management system
- New configuration options for Solana, AI Engine, and IPC
- Command-line interface for viewing and modifying configuration
- Environment variable support for configuration overrides

### Changed

- Migrated from JSON to .env format for configuration
- Updated configuration file structure and organization
- Enhanced configuration documentation in README
- Improved error handling for configuration operations

### Fixed

- Configuration file handling across different platforms
- Configuration validation and error messages
- Default configuration values and initialization

### Removed

- Legacy JSON-based configuration system

## [0.5.7]

### Changed

- Enhanced uninstallation process with better user feedback and confirmation
- Improved logs display format to show UTC timestamp
- Added preservation of log files and configuration during uninstallation
- Added detailed uninstallation summary and confirmation prompt
