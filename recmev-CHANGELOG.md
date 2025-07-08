## [0.18.24] - 2025-01-08

### Changes

- Updated package.json homepage and repository URLs to reflect new RECTOR-LABS organization
- Cleaned up repository structure with updated git tracking for .claude/ and .cursor/ directories
- Enhanced documentation with improved command references and usage examples
- Refactored configuration management with better directory structure
- Improved error handling across various command implementations
- Enhanced wallet management with better session handling and validation
- Updated build system with improved platform detection and cross-compilation support
- Streamlined installation and update process with better user feedback
- Enhanced help documentation with more comprehensive command examples
- Improved logging system with better filtering and readability
- Updated dependencies and improved overall code organization
- Enhanced security with better validation and error handling
- Improved transaction processing with better confirmation handling
- Updated configuration migration with enhanced backup and restore functionality
- Enhanced CLI interface with better command parsing and validation
- Improved wallet encryption with better key management
- Enhanced MEV discovery with improved filtering and analysis
- Updated trading engine with better risk management and execution
- Improved data persistence with better Supabase integration
- Enhanced cross-platform compatibility with better build targets

## [0.18.23]

### Changed

- **Database Integration Improvements:**

  - Updated Supabase table references from `jupiter_token_cache` to `token_mints` for better database organization
  - Improved token cache terminology throughout the codebase for consistency
  - Enhanced database query structure with updated table naming conventions

- **Token Cache System Enhancements:**

  - Renamed Jupiter-specific cache references to generic token cache for broader compatibility
  - Updated token cache loading and management functions for improved clarity
  - Enhanced token lookup system with consistent naming conventions
  - Improved token cache file naming from `jupiter_token_cache.json` to `token_cache.json`

- **Documentation and Help System Updates:**

  - Updated all help documentation to reflect generic token cache instead of Jupiter-specific references
  - Enhanced configuration help with updated Supabase parameter descriptions
  - Improved discover command documentation with clearer token cache explanations
  - Updated uninstall help documentation to reflect token cache terminology

- **Code Organization and Consistency:**
  - Refactored token cache module exports for better naming consistency
  - Updated global cache variable names for improved code clarity
  - Enhanced token lookup functions with consistent terminology
  - Improved configuration type documentation for Supabase integration

### Technical Improvements

- **Database Schema Alignment:**

  - Updated all database queries to use the new `token_mints` table structure
  - Enhanced data freshness checks with updated table references
  - Improved token statistics queries with consistent table naming
  - Better alignment with backend database schema changes

- **Cache Management:**
  - Enhanced token cache loading and saving mechanisms
  - Improved cache refresh logic with updated function names
  - Better token cache file management and organization
  - Enhanced memory cache management with consistent variable naming

## [0.18.22]

### Changed

- **Installation and Update System Improvements:**

  - Enhanced installation process with improved user interaction and better error handling
  - Added comprehensive PATH information and shell-specific guidance after installation
  - Improved installation script execution with direct user interaction support
  - Enhanced update command with detailed post-update instructions and shell configuration guidance
  - Added platform-specific shell configuration instructions (bash, zsh, fish)
  - Better error messaging and troubleshooting guidance for installation failures

- **Uninstall System Enhancements:**
  - Improved uninstall process with direct sudo command execution for better reliability
  - Added support for new user-local installation path (`~/.recmev/bin/recmev`)
  - Enhanced error handling and user feedback during uninstallation process
  - Simplified uninstall logic with better error reporting and status messages
  - Removed complex sudo wrapper functions in favor of direct command execution

### Fixed

- **Installation Process Reliability:**

  - Fixed installation script execution to properly handle user interaction and sudo prompts
  - Improved error handling for installation failures with clearer user guidance
  - Enhanced installation verification and post-installation instructions
  - Better handling of permission-related installation issues

- **Uninstall Process Improvements:**
  - Fixed sudo command execution for system file removal
  - Improved error handling for uninstall operations with detailed error reporting
  - Enhanced uninstall process reliability with direct command execution
  - Better handling of permission-related errors during system file removal

### Technical Improvements

- **User Experience Enhancements:**

  - Enhanced post-installation guidance with shell-specific instructions
  - Improved error messages with actionable troubleshooting steps
  - Better user feedback throughout installation and uninstall processes
  - Enhanced verification instructions and PATH configuration guidance

- **Code Organization:**
  - Streamlined installation and uninstall command implementations
  - Improved error handling consistency across system operations
  - Enhanced code maintainability by simplifying complex wrapper functions
  - Better separation of concerns in installation and system management code

## [0.18.21]

### Changed

- **Cross-Compilation Infrastructure:**

  - Enhanced Cross.toml configuration with improved Linux and macOS target support
  - Added proper cross-compilation setup for aarch64-apple-darwin (macOS ARM64)
  - Improved cross-compilation image configuration for better build reliability
  - Fixed Cross.toml syntax issues and added comprehensive target configurations

- **Build System Improvements:**

  - Enhanced Makefile with platform detection capabilities (UNAME_S and UNAME_M)
  - Added new development targets: `dev` for quick development builds and `dev-run` for running with arguments
  - Improved build process with native vs cross-compilation detection for macOS builds
  - Enhanced build output with better logging and status messages
  - Added comprehensive .PHONY targets for better make functionality

- **System Integration Enhancements:**
  - Improved uninstall command with direct sudo command execution for better reliability
  - Enhanced error handling in uninstall process with more detailed error reporting
  - Simplified system file removal process by removing intermediate utility functions
  - Better user feedback during uninstallation with clearer success/error messages

### Removed

- **Code Cleanup:**
  - Removed .cargo/config.toml in favor of Cross.toml configuration
  - Removed src/utils/system.rs utility module to simplify codebase
  - Cleaned up system utility exports from utils/mod.rs
  - Streamlined uninstall process by removing complex sudo wrapper functions

### Fixed

- **Build System Reliability:**

  - Fixed Cross.toml syntax errors that were preventing proper cross-compilation
  - Resolved cross-compilation configuration issues for Linux and macOS targets
  - Improved build artifact generation and copying to installer directory
  - Enhanced build verification and error detection

- **Uninstall Process Improvements:**
  - Fixed sudo command execution for system file removal
  - Improved error handling and user feedback during uninstallation
  - Enhanced uninstall process reliability with direct command execution
  - Better handling of permission-related errors during system file removal

### Technical Improvements

- **Development Workflow:**

  - Enhanced development experience with new make targets for quick builds and testing
  - Improved cross-platform build support with automatic platform detection
  - Better build system organization with clearer target definitions
  - Enhanced development productivity with streamlined build commands

- **Code Organization:**
  - Simplified utility module structure by removing unused system utilities
  - Improved code maintainability by eliminating complex wrapper functions
  - Enhanced error handling consistency across system operations
  - Better separation of concerns in build and system management code

## [0.18.20]

### Removed

- **Streamlined Project Structure:**
  - **BREAKING CHANGE**: Removed the 'discover' command and its associated functionality to streamline the project structure
  - Eliminated discover-related modules and dependencies to reduce codebase complexity
  - Removed discover command help documentation and related utility functions
  - Cleaned up command structure by removing unused discovery functionality

### Changed

- **Project Organization:**
  - Updated Cargo files to reflect version 0.18.20
  - Streamlined command structure after removing discover functionality
  - Improved project maintainability by eliminating unused code paths
  - Enhanced overall codebase efficiency through targeted feature removal

### Technical Improvements

- **Codebase Optimization:**
  - Reduced project complexity by removing non-essential discover functionality
  - Improved build performance through elimination of unused dependencies
  - Enhanced code maintainability with cleaner command structure
  - Streamlined CLI interface for better user experience

## [0.18.19]

### Removed

- **Command Structure Simplification:**
  - Removed outdated documentation and linting scripts to streamline project structure
  - Eliminated deprecated components for improved maintainability

### Added

- **Enhanced Token Discovery:**
  - Introduced new 'discover' command for token and arbitrage opportunity exploration
  - Enhanced user functionality with comprehensive discovery capabilities
  - Added token exploration and analysis features

### Changed

- **Documentation and Help System:**
  - Refactored command help documentation for clarity and consistency across modules
  - Improved help system organization and user guidance
  - Enhanced documentation structure for better accessibility

### Technical Improvements

- **Project Structure:**
  - Updated Cargo files to reflect version 0.18.19
  - Improved project organization and code structure
  - Enhanced overall system maintainability

## [0.18.18]

### Added

- **Token Discovery System:**
  - Introduced comprehensive 'discover' command for token and arbitrage opportunity exploration
  - Enhanced user functionality with advanced discovery capabilities
  - Added token analysis and exploration features

### Changed

- **Documentation Infrastructure:**
  - Refactored command help documentation for improved clarity and consistency
  - Enhanced help system organization across all modules
  - Improved user guidance and documentation accessibility

### Removed

- **Project Cleanup:**
  - Removed outdated documentation and linting scripts
  - Streamlined project structure for better maintainability
  - Eliminated deprecated components and unused code

### Technical Improvements

- **Version Management:**
  - Updated Cargo files to reflect version 0.18.18
  - Enhanced project structure and organization
  - Improved overall system efficiency

## [0.18.17]

### Added

- **Enhanced Documentation Infrastructure:**

  - Added comprehensive automated documentation system with `scripts/auto_fix_docs.py` for intelligent documentation generation and maintenance
  - Implemented advanced documentation validation with `scripts/check_docs.py` featuring configurable line count thresholds (increased from 500 to 1000 lines)
  - Added detailed `scripts/README.md` providing comprehensive guidance for development scripts and automation tools
  - Introduced `DOCUMENTATION_AUTOMATION.md` with complete documentation workflow guidelines
  - Added `LINTING_INTEGRATION.md` for comprehensive code quality and linting integration documentation

- **Advanced Development Workflow:**

  - Implemented robust pre-commit hooks system with `.githooks/pre-commit` for automated code quality enforcement
  - Added comprehensive build example with `examples/rust-build-example.yml` for CI/CD pipeline guidance
  - Enhanced development infrastructure with automated quality checks and validation systems
  - Introduced modular configuration architecture for improved maintainability and scalability

- **Modular Configuration System:**

  - Created comprehensive modular configuration system replacing monolithic `src/config.rs`
  - Added `src/config/config_types.rs` for type definitions and configuration structures
  - Implemented `src/config/migration.rs` for advanced configuration migration and versioning support
  - Added `src/config/mod.rs` as the main configuration module coordinator
  - Created `src/config/paths.rs` for centralized path management and configuration
  - Implemented `src/config/session.rs` for session management and user state handling
  - Added `src/config/wallet_management.rs` for comprehensive wallet configuration management

- **Enhanced Utility Module Architecture:**
  - Added `src/utils/supabase.rs` for comprehensive Supabase integration and Jupiter token cache management
  - Enhanced `src/utils/mod.rs` with improved module organization and exports
  - Expanded utility module structure for better code organization and reusability

### Changed

- **Major Configuration System Refactoring:**

  - **BREAKING CHANGE**: Completely refactored configuration system from monolithic `src/config.rs` (1,299 lines) to modular architecture (1,289 lines across 6 specialized modules)
  - Enhanced configuration management with improved type safety and better error handling
  - Streamlined configuration path handling with centralized path management
  - Improved session management with dedicated session handling module
  - Enhanced wallet configuration management with specialized wallet management module

- **Enhanced Command Structure and Organization:**

  - Significantly improved `src/cli.rs` with enhanced command parsing and better user experience
  - Enhanced all command modules (`about.rs`, `completions.rs`, `config.rs`, `guide.rs`, etc.) with improved error handling and user feedback
  - Improved `src/commands/config.rs` with advanced configuration management capabilities (435+ lines of enhancements)
  - Enhanced `src/commands/guide.rs` with comprehensive user guidance and improved documentation (145+ lines of improvements)
  - Streamlined command handling across all modules for consistency and better maintainability

- **Wallet Command System Improvements:**

  - Enhanced `src/commands/wallet_commands/accounts.rs` with improved account management and better error handling
  - Improved `src/commands/wallet_commands/add.rs` with enhanced wallet addition capabilities
  - Enhanced `src/commands/wallet_commands/list.rs` with better wallet listing and display formatting
  - Improved `src/commands/wallet_commands/mod.rs` with better module organization and command coordination
  - Enhanced `src/commands/wallet_commands/send.rs` with improved transaction handling (130+ lines of improvements)
  - Improved `src/commands/wallet_commands/show.rs` with better wallet information display (88+ lines of enhancements)
  - Enhanced `src/commands/wallet_commands/swap.rs` with improved swap functionality

- **Help Documentation System Enhancements:**

  - Significantly improved `src/commands/help/config_help.rs` with comprehensive configuration guidance (155+ lines of enhancements)
  - Enhanced `src/commands/help/wallet_help.rs` with better wallet command documentation (273+ lines of improvements)
  - Improved help documentation across all modules for better user guidance and clarity
  - Streamlined help system organization with better command categorization

- **Utility Module Improvements:**

  - Enhanced `src/utils/jupiter.rs` with improved Jupiter API integration (61+ lines of improvements)
  - Improved `src/utils/price.rs` with better price handling and caching (50+ lines of enhancements)
  - Enhanced `src/utils/system.rs` with improved system integration capabilities
  - Added comprehensive utility module exports and organization

- **Build System and Project Structure:**
  - Enhanced `Makefile` with improved build targets and development workflow automation
  - Streamlined `Cargo.lock` removing unused dependencies for better performance and reduced bloat
  - Updated `Cargo.toml` with optimized dependency management
  - Improved project structure with better module organization and separation of concerns

### Removed

- **Deprecated and Obsolete Components:**

  - **BREAKING CHANGE**: Removed monolithic `src/config.rs` (1,299 lines) in favor of modular configuration system
  - Removed entire database command system including all database-related modules:
    - Removed `src/commands/database/backup_database.rs` (21 lines)
    - Removed `src/commands/database/init_database.rs` (30 lines)
    - Removed `src/commands/database/install_database.rs` (758 lines)
    - Removed `src/commands/database/migrate_database.rs` (30 lines)
    - Removed `src/commands/database/mod.rs` (175 lines)
    - Removed `src/commands/database/optimize_database.rs` (39 lines)
    - Removed `src/commands/database/query_database.rs` (119 lines)
    - Removed `src/commands/database/restore_database.rs` (17 lines)
    - Removed `src/commands/database/setup_database.rs` (30 lines)
    - Removed `src/commands/database/status_database.rs` (46 lines)
    - Removed `src/commands/database/uninstall_database.rs` (258 lines)
  - Removed `src/commands/help/database_help.rs` (554 lines) as database functionality was deprecated
  - Removed `.pre-commit-config.yaml` (16 lines) in favor of custom git hooks system

- **Streamlined Dependencies and Configuration:**
  - Cleaned up unused dependencies from `Cargo.lock` (76 lines removed) for better performance
  - Removed obsolete configuration files and deprecated settings
  - Eliminated redundant code and improved overall codebase efficiency

### Fixed

- **Code Quality and Maintenance:**

  - Fixed module imports and dependencies after major configuration system refactoring
  - Resolved circular dependencies and improved module structure throughout the codebase
  - Enhanced error handling consistency across all command modules
  - Improved code organization with better separation of concerns and reduced code duplication

- **Configuration System Stability:**

  - Fixed configuration migration issues with improved backup and recovery mechanisms
  - Enhanced configuration validation with better error reporting and user feedback
  - Improved configuration path handling with more robust path resolution
  - Fixed session management issues with better state handling and persistence

- **Documentation and Help System:**
  - Fixed documentation generation issues with improved automation scripts
  - Enhanced help system consistency across all command modules
  - Improved documentation validation with configurable thresholds and better error reporting
  - Fixed formatting issues in help documentation for better readability

### Technical Improvements

- **Architecture and Performance:**

  - Implemented modular configuration architecture reducing complexity and improving maintainability
  - Enhanced code organization with 75 files changed, 4,457 additions, and 3,878 deletions for net positive improvement
  - Improved build system performance with streamlined dependencies and better caching
  - Enhanced development workflow with automated quality checks and comprehensive testing

- **Development Infrastructure:**

  - Implemented comprehensive pre-commit hooks system for automated code quality enforcement
  - Added advanced documentation automation with intelligent generation and validation
  - Enhanced development scripts with comprehensive guidance and automation tools
  - Improved CI/CD pipeline support with detailed build examples and configuration

- **Security and Reliability:**
  - Enhanced configuration security with improved validation and error handling
  - Improved wallet management security with better encryption and key handling
  - Enhanced session management with better state validation and persistence
  - Improved overall system reliability with better error handling and recovery mechanisms

## [0.18.12]

### Added

- **Enhanced Development Infrastructure:**

  - Added comprehensive pre-commit hooks system with `.githooks/pre-commit` for automated code quality checks
  - Implemented automated documentation system with `scripts/auto_fix_docs.py` and `scripts/check_docs.py`
  - Added `DOCUMENTATION_AUTOMATION.md` and `LINTING_INTEGRATION.md` for development guidelines
  - Enhanced `.pre-commit-config.yaml` configuration for better code quality enforcement
  - Added comprehensive `scripts/README.md` documentation for development scripts

- **Advanced Configuration Management:**

  - Introduced Supabase integration for Jupiter token cache with configurable URL and anonymous key settings
  - Added configuration migration functionality with automatic backup support
  - Implemented force migration options allowing users to migrate configuration files to latest version
  - Enhanced configuration structure with improved organization and clarity
  - Added Supabase connection testing capabilities within configuration system

- **Modular Help Documentation System:**

  - Created comprehensive modular help system replacing monolithic `help.rs`
  - Added dedicated help modules: `config_help.rs`, `install_help.rs`, `logs_help.rs`, `report_help.rs`, `trade_help.rs`, `uninstall_help.rs`, `wallet_help.rs`
  - Enhanced help documentation with detailed examples and improved user guidance
  - Implemented context-sensitive help with better command organization

- **Improved Utility Module Architecture:**
  - Added new `utils/supabase.rs` module for Supabase integration and token cache management
  - Created `wallet_commands/keypair_utils.rs` for centralized keypair utility functions
  - Enhanced modular code organization with better separation of concerns

### Changed

- **Major Code Refactoring and Organization:**

  - Moved core utility modules (`executor.rs`, `ipc.rs`, `jupiter.rs`, `price.rs`) from `src/` to `src/utils/` directory
  - Consolidated wallet command functionality by removing `wallet.rs` and enhancing `wallet_commands/mod.rs`
  - Removed obsolete `wallet_commands/wallets.rs` module to streamline codebase
  - Refactored command handling across all modules for improved maintainability

- **Enhanced Command Structure:**

  - Improved CLI argument parsing and command dispatch in `cli.rs`
  - Enhanced all command modules (`about.rs`, `completions.rs`, `config.rs`, `guide.rs`, etc.) with better error handling
  - Centralized help command handling for consistency across all commands
  - Improved command feedback and user experience

- **Configuration System Improvements:**

  - Significantly enhanced `config.rs` with advanced configuration management capabilities
  - Added support for configuration versioning and migration tracking
  - Improved configuration validation and error handling
  - Enhanced configuration display and modification capabilities

- **Build System and Dependencies:**
  - Updated `Makefile` with improved build targets and development workflows
  - Cleaned up `Cargo.lock` removing unused dependencies for better performance
  - Streamlined `Cargo.toml` dependencies removing `comfy-table` and `regex` to reduce bloat
  - Enhanced build process with better dependency management

### Fixed

- **Code Quality and Maintenance:**

  - Removed duplicate code and improved code organization across all modules
  - Fixed formatting issues in command output for better readability
  - Enhanced error handling in time parsing functions for better user feedback
  - Improved transaction handling consistency across wallet commands

- **Module Dependencies and Imports:**
  - Fixed module imports and dependencies after major refactoring
  - Resolved circular dependencies and improved module structure
  - Enhanced code maintainability with better separation of concerns
  - Fixed various formatting and display issues throughout the codebase

### Removed

- **Deprecated and Unused Components:**
  - Removed monolithic `src/commands/help.rs` in favor of modular help system
  - Removed `src/commands/wallet.rs` consolidating functionality into `wallet_commands/mod.rs`
  - Removed `src/commands/wallet_commands/wallets.rs` to eliminate redundancy
  - Cleaned up unused dependencies (`comfy-table`, `regex`) from Cargo files
  - Removed obsolete utility modules from root `src/` directory after reorganization

### Technical Improvements

- **Development Workflow Enhancements:**

  - Implemented automated code quality checks with pre-commit hooks
  - Added comprehensive documentation automation scripts
  - Enhanced development scripts for better maintainability
  - Improved build system with better error detection and reporting

- **Architecture Improvements:**
  - Enhanced modular architecture with better separation of concerns
  - Improved code organization with dedicated utility modules
  - Better error handling and user feedback across all operations
  - Enhanced configuration management with migration support

## [0.18.11]

### Changed

- Updated recmev to version 0.18.11
- Removed unused dependencies from Cargo files, including comfy-table and regex, to streamline the project
- Refactored command output formatting for improved readability in help and wallet commands
- Enhanced error handling in time parsing functions for better user feedback

## [0.18.10]

### Added

- Introduced local pre-commit hooks for cargo check and cargo clippy to enhance code quality checks

### Changed

- Updated recmev to version 0.18.10
- Refactored configuration management to improve structure and clarity
- Updated help documentation for better user guidance
- Adjusted dependencies in Cargo files accordingly

## [0.18.9]

### Added

- Introduced configuration migration functionality with backup support, allowing users to force migration of configuration files to the latest version

### Changed

- Updated recmev to version 0.18.9
- Enhanced command handling to include migration options
- Improved help documentation for new commands
- Updated dependencies in Cargo files accordingly

## [0.18.8]

### Added

- Implemented Supabase integration for Jupiter token cache
- Added configuration options for Supabase URL, anonymous key, and cache settings

### Changed

- Updated recmev to version 0.18.8
- Enhanced command handling to support Supabase connection testing
- Improved help documentation for new configuration options
- Updated dependencies in Cargo files accordingly

## [0.18.7]

### Added

- **Improved Help Documentation System:**

  - Created comprehensive help modules for all major commands (install, uninstall, wallet, config, logs, trade, report)
  - Enhanced install and uninstall help with step-by-step guidance
  - Improved wallet help documentation with comprehensive command examples

- **New Utility Module Structure:**
  - Moved core utilities (executor, ipc, jupiter, price) to dedicated utils module
  - Added keypair utility functions for improved wallet management
  - Enhanced modular code organization for better maintainability

### Changed

- **Major Code Refactoring and Organization:**

  - Consolidated wallet-related functions into wallet_commands module for improved organization
  - Moved utility modules (executor, ipc, jupiter, price) to utils directory for better structure
  - Centralized help command handling across all modules for consistency
  - Streamlined command handling in main.rs with improved organization

- **Wallet Command Enhancements:**

  - Refactored wallet command structure by moving keypair utilities to dedicated module
  - Improved wallet accounts command with better error handling
  - Enhanced transaction history display with better formatting
  - Consolidated wallet-related functions for improved maintainability
  - Removed obsolete wallets module to streamline codebase

- **Configuration and Help System:**

  - Centralized help logic in config command for improved maintainability
  - Improved overall user guidance with better command documentation
  - Refined help command output organization and readability
  - Updated configuration help documentation for clarity

- **Build and Dependency Management:**
  - Updated dependencies in Cargo files to reflect new version
  - Cleaned up unused dependencies for better performance
  - Enhanced build process with improved module structure
  - Updated Cross.toml and Makefile for better build management

### Fixed

- **Code Organization and Maintenance:**

  - Removed duplicate help information and centralized help message handling
  - Fixed formatting issues in command help display
  - Improved command line argument handling for nested subcommands
  - Fixed module imports and dependencies after refactoring

- **General Improvements:**
  - Enhanced transaction handling consistency across commands
  - Improved user experience with better progress indicators
  - Fixed various formatting and display issues
  - Enhanced overall code maintainability and organization

### Removed

- **Deprecated Modules and Files:**
  - Removed unused wallets module from wallet_commands
  - Cleaned up obsolete help.rs file in favor of modular help system
  - Removed unused executor, ipc, jupiter, and price modules from root src directory

### Technical Improvements

- **Development Workflow Enhancements:**

  - Implemented automated code quality checks with pre-commit hooks
  - Added comprehensive documentation automation scripts
  - Enhanced development scripts for better maintainability
  - Improved build system with better error detection and reporting

- **Architecture Improvements:**
  - Enhanced modular architecture with better separation of concerns
  - Improved code organization with dedicated utility modules
  - Better error handling and user feedback across all operations
  - Enhanced configuration management with migration support

## [0.17.16]

### Added

- Enhanced error handling for wallet accounts commands

### Changed

- Improved help message display for wallet accounts subcommands:
  - Enhanced formatting with better spacing for option descriptions
  - Updated example commands with latest parameter naming conventions
  - Added additional examples demonstrating priority fee usage
- Refined transaction handling in Jupiter client:
  - Standardized transaction confirmation process for both legacy and versioned transactions
  - Used consistent spinner display for better user experience across all transaction types
- Updated author information in Cargo.toml to "RECTOR (RECTOR LABS"
- Improved transaction explorer URL generation based on cluster type (devnet, testnet, mainnet)

### Fixed

- Centralized help message handling for wallet accounts close command:
  - Moved duplicate help information to the main help system
  - Ensured consistent error messages when required parameters are missing
  - Fixed formatting issues in command help display
- Removed unnecessary imports and improved code organization in Jupiter client
- Improved command line argument handling for nested subcommands

## [0.17.15]

### Added

- Comprehensive uninstall command with improved user experience:
  - New `uninstall` command with detailed removal options
  - Added `--all` flag for complete cleanup including data and configuration
  - Smart detection of system vs. user installations
  - Platform-specific guidance for system installations requiring sudo
  - Detailed reporting of uninstallation progress and results
- Enhanced logs command with filtering options:
  - Added `--detailed` flag to display additional technical information
  - Improved control over log output verbosity for better readability
  - Enhanced filtering for request IDs and duration metrics
- Centralized help command handling:
  - Moved CLI help functionality to dedicated help module
  - Improved command documentation and examples
  - Better organization of help-related code for maintenance

### Changed

- Enhanced transaction history display in wallet commands:
  - Added rate limiting for RPC requests to prevent API throttling
  - Implemented configurable RPS limit in configuration
  - Added progress indicators and animated spinners during data fetching
  - Improved visual feedback for long-running operations
- Improved version tracking and configuration:
  - Enhanced version information display in commands
  - Added configuration version tracking across commands
  - Better logging with version context for troubleshooting
- Refactored command handling for better organization:
  - Modularized command implementation for better maintainability
  - Centralized help command handling for consistency
  - Improved command feedback and error reporting

### Fixed

- Fixed log display formatting for better readability
- Improved rate limiting for Solana RPC requests
- Enhanced error handling in wallet operations
- Fixed command help display for wallet subcommands

## [0.17.10]

### Added

- Added version tracking system with build timestamps:
  - New `VersionConfig` to store version information and build timestamps
  - Enhanced configuration to display version details in the config command
  - Improved logging with version information at startup and during command execution
- Enhanced logging system:
  - Added `detailed` flag to logs command for more granular control over log output
  - Improved log filtering to hide technical details like request_id and duration by default
  - Added human-readable timestamp formatting for better readability

### Changed

- Upgraded configuration system with version tracking:
  - Added automatic versioning of configuration files
  - Implemented backward compatibility handling for older config formats
  - Enhanced config display to show version and build information
- Improved error handling for configuration file parsing with graceful fallbacks
- Enhanced logging output formatting for better readability

### Fixed

- Fixed legacy configuration loading to handle missing version information
- Improved config migration process to preserve user settings while adding new fields
- Enhanced log command to handle different levels of detail without overwhelming output

## [0.17.9]

### Added

- Enhanced wallet management system:
  - Implemented multi-wallet support with encrypted storage
  - Added `wallet add` command with options for secure input and new wallet creation
  - Added `wallet remove` command to delete wallets with confirmation
  - Added `wallet use` command to switch between wallets
  - Added `wallet export` command with multiple format options (bs58, keypair, JSON)
  - Added secure wallet key encryption with password protection
- Improved wallet display functionality:
  - Enhanced `wallet list` command with color-coded status indicators
  - Added support for viewing encrypted wallet information
  - Improved wallet address display with better formatting
- Added automatic migration from single-wallet to multi-wallet configuration
- Implemented machine-specific session bindings for enhanced security

### Changed

- Refactored configuration system for multi-wallet support:
  - Updated Config struct with WalletConfig for better organization
  - Enhanced wallet key derivation with support for multiple formats
  - Improved error handling and user feedback for wallet operations
- Improved session management for encrypted wallet keys
- Enhanced security with better password handling and encryption
- Updated wallet utilities with better validation and error checking

### Fixed

- Fixed private key validation and format detection
- Improved error handling for wallet operations with better user feedback
- Enhanced session security with machine-specific bindings
