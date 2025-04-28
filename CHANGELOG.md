# What's Changed

## [0.13.9]

### Changed

- Version bump to 0.13.9 for release
- Updated dependencies for better performance

### Fixed

- Various bug fixes and stability improvements

## [0.13.8]

### Changed

- Version bump to 0.13.8 for release
- See below for previous changes

## [0.13.7]

### Fixed

- Various small bug fixes and stability improvements
- Fixed minor issues with config handling

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

### Changed

- Modified reqwest dependency to use rustls-tls instead of OpenSSL
- Improved cross-compilation support by removing native dependencies

### Fixed

- Resolved OpenSSL dependency issues during Linux builds

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

- New configuration system with improved structure
- Enhanced uninstall command with --all flag
- Better error messages and user feedback
- Improved configuration initialization experience

### Changed

- Updated configuration format for better organization
- Enhanced logging with clearer messages
- Improved error messages and guidance

### Fixed

- Configuration file handling
- Log directory creation
- Various error handling improvements

### Removed

- Legacy configuration support
- Outdated configuration methods

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

## [0.5.6]

### Fixed

- Fixed bug where `recmev logs` command would not find logs in custom log directories set via `recmev config --log-dir`
- Improved log directory handling to ensure proper creation of custom log directories with parent paths

## [0.5.5]

### Added

- Added log tailing functionality with new `-f/--follow` flag for the `logs` command
- Added `notify` dependency (v6.1.1) for file system monitoring

### Changed

- Enhanced log viewing command with real-time log following capability
- Improved log display formatting and organization

## [0.5.4]

### Changed

- Updated version checking mechanism from GitHub API to using version.txt in recMEV-installer repository

## [0.5.3] - 2024-03-26

### Added

- Enhanced CLI user feedback with additional console output for better user experience
- Improved visibility of update and uninstall processes with real-time status messages

## [0.5.2] - 2024-03-25

### Changed

- Improved build system with Git hash handling
- Updated Makefile to include Git hash in binary builds
- Optimized Git hash retrieval in main.rs using compile-time environment variables

## [0.5.1] - 2024-03-24

### Added

- Initial release of recMEV
- Core functionality for MEV detection and analysis
- Command-line interface with clap
- Logging system with tracing
- Solana SDK integration
- HTTP client with reqwest
- Version management with semver
- Interactive CLI with dialoguer
- Date/time handling with chrono
- Directory management with dirs

### Changed

- N/A (Initial release)

### Fixed

- N/A (Initial release)

### Removed

- N/A (Initial release)
