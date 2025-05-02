# What's Changed

## [0.15.14]

### Added

- Enhanced report command with powerful filtering capabilities:
  - New `--last-hours` option to filter logs from recent time periods
  - New `--from-time` and `--to-time` options for precise log timeframe selection
  - Time-based log filtering with flexible format support
  - Intelligent log parsing for enhanced reporting
- Report command improvements for better customer support:
  - Option to send reports directly to the development team
  - Improved report formatting and organization
  - Better report file naming and storage structure
  - More comprehensive system information collection
- Improved terminal user experience with colorful output:
  - Color-coded log levels for better readability (ERROR, WARN, INFO, DEBUG)
  - Enhanced formatting of command outputs with highlighting
  - Visual distinction between different data types and severity levels
  - Better visual hierarchy in log and report displays
- Shell completion improvements:
  - Auto-detection of shell type for easier configuration
  - Better help documentation for completions command
  - Enhanced completion scripts with more context
  - Support for custom completion output directories

### Changed

- Refactored update command for more robust version handling:
  - Version-specific installation script URLs for better compatibility
  - Improved version comparison and display
  - Enhanced error reporting for update failures
  - Better user guidance for version verification
- Improved command-line interface:
  - More colorful and informative terminal outputs
  - Better visual indicators for command status and progress
  - Enhanced feedback for long-running operations
  - Improved help text formatting and organization
- Enhanced error handling throughout the application:
  - Better error messages for network and configuration issues
  - More detailed logging of operation failures
  - Improved error context for better troubleshooting
  - More user-friendly error displays in terminal outputs

### Fixed

- Update process improvements:
  - Fixed handling of version tags with/without 'v' prefix
  - Improved error detection for unavailable version updates
  - Enhanced update cancellation process
  - Better validation of installation script execution
- Better logging display:
  - Fixed alignment issues in log table formatting
  - Improved timestamp format consistency
  - Enhanced parsing of complex log entries
  - Better handling of multiline log messages
- Enhanced command documentation:
  - Fixed inconsistencies in command help texts
  - Improved command examples for clarity
  - Better parameter descriptions across all commands
  - More consistent formatting of help outputs

## [0.15.13]

### Added

- Advanced wallet security with enhanced encryption capabilities:
  - Implemented AES-256-GCM encryption for wallet private keys
  - Added PBKDF2 key derivation for secure password-based encryption
  - Salt generation and secure nonce handling for encryption
  - Secure storage format with base64 encoding for encrypted keys
  - Comprehensive decryption features with robust error handling
- Enhanced command-line interface for security operations:
  - Interactive password prompting with confirmation for key encryption
  - Secure input masking when entering sensitive information
  - Automatic encryption prompting after key input for better security
- Improved security validation and checks:
  - Validation of key length and format before encryption
  - Multiple layers of error handling for encryption/decryption operations
  - Memory safety improvements when handling sensitive data
  - Enhanced password validation with confirmation workflows
- Extended documentation for security features:
  - Comprehensive guide for wallet key encryption
  - Detailed explanation of security best practices
  - Step-by-step instructions for key management

### Changed

- Refactored key management system:
  - Separated plaintext and encrypted key storage
  - Improved key lifecycle management
  - Better error messages for encryption operations
  - Enhanced configuration save procedures for keys
- Updated dependency management:
  - Added explicit versions for cryptographic libraries
  - Updated security-critical dependencies
  - Optimized dependency tree for smaller binary size
  - Improved build system for consistent versioning
- Enhanced user experience for security operations:
  - Clearer prompts for security-related actions
  - Better feedback during encryption/decryption
  - Improved error reporting for failed security operations
  - More intuitive workflow for key management

### Fixed

- Resolved issues with wallet key handling:
  - Fixed potential race conditions during key operations
  - Addressed edge cases in encryption workflow
  - Corrected error handling in decryption process
  - Improved validation for malformed encrypted keys
- Security-related fixes:
  - Addressed potential vulnerabilities in key storage
  - Fixed issues with password handling
  - Improved error reporting for security operations
  - Enhanced validation for cryptographic operations

## [0.15.9]

### Added

- Enhanced config command with improved security features:
  - New `--clear-key` option to completely remove wallet keys
  - New `--log-path` option to display current log file path
  - New `--log-status` option showing detailed logging information
- Advanced logging system with comprehensive error reporting:
  - Context-aware error display for better troubleshooting
  - Additional fields for ERROR and WARN log levels
  - Transaction details included in relevant log entries
- Improved wallet security with encryption enhancements:
  - Streamlined key encryption workflow
  - Better handling of key formats and validation
  - Multiple key file format support

### Changed

- Redesigned config command interface:
  - Removed `--log-dir` option in favor of automatic management
  - Removed `--password` option for better security practices
  - Added validation for configuration changes
  - Improved user feedback for configuration updates
- Enhanced log command display format:
  - Better formatting for improved readability
  - Color-coded log levels for easier parsing
  - Additional help text for common log operations
- Improved guide command with more comprehensive information:
  - Detailed command descriptions and examples
  - Organized sections for better navigation
  - Tips and best practices for common operations
- Expanded user documentation throughout the application

### Fixed

- Improved error handling for configuration operations
- Better validation for wallet key file formats
- Enhanced display of configuration options
- Fixed various minor UI formatting issues
- Streamlined help text for better clarity

## [0.15.7]

### Changed

- Version bump to 0.15.7 for release
- Enhanced stability and performance improvements
- Updated dependencies for better security and performance

### Fixed

- Various bug fixes and code optimizations

## [0.15.6]

### Changed

- Version bump to 0.15.6 for release
- Enhanced stability and performance improvements
- Updated dependencies for better security and performance

### Fixed

- Various bug fixes and code optimizations

## [0.15.4]

### Added

- New `install` command for version management:
  - Install specific versions with `recmev install --version <VERSION>`
  - List available versions with `recmev install --list`
  - View version history with release dates
  - Version caching for handling GitHub API rate limits
- Shell completion support for Bash, Zsh, and Fish shells
- Automatic shell integration during installation
- Enhanced version management with detailed version listing
- New shell completion files: recmev.bash, recmev.fish, and recmev.zsh

### Changed

- Version bump to 0.15.4 for release
- Enhanced stability and performance improvements
- Improved UI formatting in swap command output
- Better error handling for GitHub API interactions
- Enhanced installation process with better feedback
- Updated documentation with shell completion setup guides
- Improved installer script with automatic shell detection

### Fixed

- Various bug fixes and code optimizations
- Minor display formatting issues
- Cross-shell compatibility for completions

## [0.14.4]

### Changed

- Version bump to 0.14.4 for release
- Enhanced stability and performance improvements

### Fixed

- Various bug fixes and code optimizations

## [0.13.10]

### Changed

- Version bump to 0.13.10 for release
- Enhanced stability and performance

### Fixed

- Various bug fixes and code improvements

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
