# Full Changelog History

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

// ... existing code ...
