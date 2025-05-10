# What's Changed

## [0.16.21]

### Added

- Implemented real transaction handling in Jupiter client
- Added new price module for token price lookups via Jupiter API
- Added caching system for token prices with disk persistence
- Added special handling for JUP token swaps with adjusted slippage and priority fees
- Added proper error handling for slippage errors with user guidance
- Implemented batch price fetching for multiple tokens

### Changed

- Updated CLI to provide better help messages for wallet subcommands
- Improved quote display with better formatting for token amounts
- Enhanced swap transaction handling with proper signing and confirmation flow
- Implemented fallback mechanisms for API requests

### Fixed

- Fixed transaction submission and confirmation flows
- Improved error handling with more descriptive error messages
- Enhanced handling of versioned transactions

## [0.16.3]

### Added

- Added author information to Cargo.toml with "RECTOR" as the author
- Improved project metadata and attribution

### Changed

- Updated from version 0.16.2 to 0.16.3
- Enhanced documentation and project identification

## [0.16.2]

### Added

- New wallet management features:
  - `wallet show` command to display balance of SOL and SPL tokens
  - `wallet send` command to transfer SOL and SPL tokens to other wallets
  - `wallet wsol` command for wrapping and unwrapping SOL
  - Comprehensive help documentation for all wallet subcommands

### Changed

- Refactored CLI command structure:
  - Moved `swap` command under the `wallet` namespace (`wallet swap`)
  - Added backward compatibility notes for users of the previous `swap` command
  - Organized token-related functionality under a unified `wallet` command group
- Updated default Solana RPC URL from devnet to mainnet:
  - Changed from `https://api.devnet.solana.com` to `https://solana-rpc.publicnode.com`
  - Updated examples in help text to use mainnet URLs
- Improved command help text and documentation:
  - Enhanced command examples with clearer formatting
  - Added more detailed explanations for command options
  - Updated guide with new wallet command examples

### Fixed

- Downgraded subtle dependency from version 2.6.1 to 2.4.1 to resolve compatibility issues

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
  - Improved version comparison and display
  - Better user guidance for version verification
  - Fixed handling of version tags with/without 'v' prefix
  - Improved error detection for unavailable version updates

### Fixed

- Improved build system for consistent versioning

## [0.15.13]

### Added

- Automated cleanup of old binary versions during release process

### Changed

- Improved release process documentation with explicit version cleanup steps

## [0.15.9]

### Added

- Updated build system to ensure consistent versioning across all components

## [0.15.7]

### Added

- Added explicit versions for cryptographic libraries

## [0.15.6]

### Changed

- Updated version checking mechanism from GitHub API to using version.txt in recMEV-installer repository

## [0.15.4]

### Added

- New `install` command for version management:
  - Install specific versions with `recmev install --version <VERSION>`
  - List available versions with `recmev install --list`
  - View version history with release dates
- Shell completion support for Bash, Zsh, and Fish shells
- Automatic shell integration during installation

### Changed

- Improved UI formatting in swap command output
- Better error handling for GitHub API interactions with rate limiting
- Enhanced installation process with real-time feedback

### Fixed

- Fixed display formatting in swap command priority fee output
- Resolved cross-shell compatibility issues for completions
- Improved caching mechanism for version data

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
