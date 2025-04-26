# Changelog

## [0.11.0]

### Added

- Pure Rust TLS implementation using rustls-tls

### Changed

- Modified reqwest dependency to use rustls-tls instead of OpenSSL
- Improved cross-compilation support by removing native dependencies

### Fixed

- Resolved OpenSSL dependency issues during Linux builds
