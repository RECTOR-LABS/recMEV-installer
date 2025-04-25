# Changelog

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
