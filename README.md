<div align="center">

# 🛠️ recMEV Installer

**Automated installer for recMEV: Solana DEX pool discovery tool**

[![Stars](https://img.shields.io/github/stars/RECTOR-LABS/recMEV-installer?style=social)](https://github.com/RECTOR-LABS/recMEV-installer/stargazers)
[![Shell](https://img.shields.io/badge/Shell-Script-89E051?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Rust](https://img.shields.io/badge/Rust-Backend-CE422B?style=for-the-badge&logo=rust&logoColor=white)](https://rust-lang.org)

🚀 **Public Infrastructure** | ⚡ **One-Command Setup** | 🕌 **Built with Excellence**

[📖 Documentation](#) • [🏛️ RECTOR LABS](https://github.com/RECTOR-LABS)

</div>

---

## 🎯 Purpose

**Make Solana MEV tools accessible to everyone.**

recMEV is a powerful Rust-based tool for discovering liquidity pools on Solana DEXs—critical for MEV strategies. But setting it up manually is complex:

- 🔧 Multiple dependencies (Rust, Solana CLI, Node.js, PostgreSQL)
- ⚙️ Complex configuration (RPC endpoints, database, environment variables)
- 🐛 Common errors (port conflicts, permission issues, missing packages)
- 📚 Long manual installation process

**recMEV Installer solves this:** One command installs everything, properly configured.

---

## ✨ What It Does

**Automated, idempotent installation script that:**

- ✅ **Checks System** - Detects OS, architecture, existing installations
- 📦 **Installs Dependencies** - Rust, Solana CLI, PostgreSQL, Node.js
- 🔐 **Generates Configs** - .env files, database configs, RPC settings
- 🗄️ **Sets Up Database** - Creates PostgreSQL database with schema
- 🔧 **Builds recMEV** - Compiles Rust binaries with optimizations
- ✅ **Verifies Installation** - Runs health checks, confirms working setup
- 📝 **Provides Next Steps** - Clear instructions for running recMEV

**Tagline:** *"From zero to MEV discovery in minutes."*

---

## 🛠️ Tech Stack

**Installer:**
- Bash shell script (POSIX-compatible)
- Supports: Linux (Ubuntu, Debian, CentOS, Arch), macOS

**recMEV Backend (What Gets Installed):**
- Rust 1.70+ (high-performance pool discovery)
- Solana CLI 1.16+ (blockchain interaction)
- PostgreSQL 14+ (pool data storage)
- Node.js 18+ (optional frontend)

**Dependencies Managed:**
- curl/wget (downloading)
- git (cloning repos)
- build-essential (compiling)
- pkg-config, openssl (build dependencies)

---

## 🚀 Quick Start

### Prerequisites

```bash
- Linux or macOS (Windows via WSL2)
- Sudo/root access
- Internet connection
- 4GB+ RAM, 20GB+ disk space
```

### Installation

**One-command install:**

```bash
curl -sSfL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-installer/main/install.sh | bash
```

**Or download and run:**

```bash
git clone https://github.com/RECTOR-LABS/recMEV-installer.git
cd recMEV-installer
chmod +x install.sh
./install.sh
```

### What Happens During Install

```
1. System check (OS, architecture, permissions)
2. Install Rust (via rustup)
3. Install Solana CLI (via official installer)
4. Install PostgreSQL (via package manager)
5. Install Node.js (via nvm or package manager)
6. Clone recMEV repository
7. Generate .env configuration
8. Create PostgreSQL database
9. Build recMEV (cargo build --release)
10. Run verification tests
11. Display next steps
```

**Time:** ~10-15 minutes depending on internet speed and system specs.

---

## 📖 Usage

### Post-Installation

After installation completes:

```bash
# Navigate to recMEV directory
cd ~/recMEV

# Start the pool discovery service
./target/release/recmev

# Check status
./target/release/recmev status

# View discovered pools
./target/release/recmev pools --limit 10
```

### Configuration

Edit `~/recMEV/.env` to customize:

```bash
# Solana RPC endpoint (use your own for rate limits)
SOLANA_RPC_URL=https://api.mainnet-beta.solana.com

# PostgreSQL connection
DATABASE_URL=postgresql://recmev:password@localhost/recmev_db

# Pool refresh interval (seconds)
REFRESH_INTERVAL=60

# DEXs to monitor (comma-separated)
MONITORED_DEXS=raydium,orca,lifinity,meteora
```

### Updating recMEV

```bash
cd ~/recMEV
git pull origin main
cargo build --release
```

---

## 🎨 Features

### Intelligent Installation
- 🔍 **Detects Existing** - Skips already installed components
- 🔄 **Idempotent** - Safe to run multiple times
- 📝 **Verbose Logging** - Shows what's happening, helps debugging
- 🛡️ **Error Handling** - Graceful failures with clear messages

### Cross-Platform Support
- 🐧 **Linux** - Ubuntu, Debian, CentOS, Arch, Fedora
- 🍎 **macOS** - Intel and Apple Silicon (M1/M2)
- 🪟 **Windows** - Via WSL2 (Ubuntu/Debian)

### Security
- ✅ **No Root Execution** - Runs as user (sudo only when needed)
- 🔒 **Secure Defaults** - Strong PostgreSQL passwords
- 🔐 **Key Management** - Generates Solana keypairs securely
- 📋 **Permissions** - Proper file/directory permissions

### Developer-Friendly
- 📖 **Clear Output** - Color-coded status messages
- 🐛 **Debug Mode** - `./install.sh --debug` for troubleshooting
- 🧪 **Test Mode** - `./install.sh --test` for dry runs
- 📄 **Logs** - Installation log saved to `install.log`

---

## 🔧 Advanced Usage

### Custom Installation Path

```bash
./install.sh --path /opt/recmev
```

### Skip Components

```bash
# Skip PostgreSQL (use existing instance)
./install.sh --skip-postgres

# Skip Node.js (backend only)
./install.sh --skip-nodejs
```

### Uninstall

```bash
./uninstall.sh
# Removes recMEV and optionally installed dependencies
```

---

## 🌟 Highlights

**Why This Installer Matters:**

- 🚀 **Accessibility** - MEV tools available to all, not just experts
- 💰 **Cost Savings** - Avoid hours of manual configuration
- 🛡️ **Reliability** - Tested on dozens of systems
- 🌐 **Community** - Open-source, contributions welcome
- 🕌 **Service** - Building public infrastructure for the ecosystem

**Technical Achievements:**
- POSIX-compliant shell script (works everywhere)
- Idempotent installation (safe reruns)
- Comprehensive error handling
- Cross-platform package manager detection

**Lessons Learned:**
- Shell scripting is powerful for automation
- Dependency hell is real—handle it carefully
- User experience matters for developer tools
- Good defaults > configuration options

---

## 🗺️ Roadmap

**Phase 1: Core Installer** ✅ (Jul 2025)
- [x] Linux support (Ubuntu, Debian)
- [x] macOS support
- [x] Basic error handling
- [x] Documentation

**Phase 2: Enhancements** 🚧 (Nov-Dec 2025)
- [ ] Windows WSL2 detection and support
- [ ] Docker installation option
- [ ] Auto-update mechanism
- [ ] Interactive configuration wizard

**Phase 3: Ecosystem** 📋 (Q1 2026)
- [ ] Support for recMEV plugins
- [ ] Multi-node cluster setup
- [ ] Monitoring dashboard installer
- [ ] Community package repository

---

## 🤝 Contributing

**recMEV Installer is community infrastructure—contributions welcome!**

**How to help:**
- 🐧 Test on different Linux distros
- 🍎 Test on macOS versions (Intel/M1/M2)
- 🐛 Report bugs and edge cases
- 📖 Improve documentation
- ✨ Add features (Docker support, etc.)

**Guidelines:**
1. Fork repository
2. Create feature branch (`git checkout -b feature/DockerSupport`)
3. Test on multiple platforms
4. Commit with clear messages (`git commit -m 'feat: Add Docker installation'`)
5. Push and open Pull Request

---

## 📄 License

MIT License (open source for community benefit)

---

## 🙏 Acknowledgments

- **recMEV Team** - For building the core pool discovery tool
- **Rust Community** - For excellent tooling (rustup, cargo)
- **Solana Foundation** - For the Solana CLI
- **Shell Script Community** - For POSIX best practices

---

## 🔗 Links

- 🌐 [rectorspace.com](https://rectorspace.com)
- 🐙 [@rz1989s](https://github.com/rz1989s)
- 🏛️ [RECTOR-LABS](https://github.com/RECTOR-LABS)
- 🛠️ [recMEV Backend Installer](https://github.com/RECTOR-LABS/recMEV-backend-installer)

---

## 🆘 Troubleshooting

**Common Issues:**

**1. Permission Denied**
```bash
chmod +x install.sh
./install.sh
```

**2. Rust Not Found After Install**
```bash
source ~/.cargo/env
```

**3. PostgreSQL Connection Failed**
```bash
sudo systemctl start postgresql
```

**4. Port Already in Use**
```bash
# Edit ~/recMEV/.env and change PORT=8080 to another port
```

**5. RPC Rate Limit**
```bash
# Get your own RPC from Helius, QuickNode, etc.
# Edit ~/recMEV/.env: SOLANA_RPC_URL=https://your-rpc-url
```

**Still stuck?** Open an issue with `install.log` attached.

---

<div align="center">

**Built with Bismillah** 🕌

*May this tool empower developers and democratize MEV. Aamiin.*

---

[🏛️ RECTOR LABS](https://github.com/RECTOR-LABS) | Building for Eternity | 2025

[![Shell](https://img.shields.io/badge/Shell-89E051?style=flat&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Rust](https://img.shields.io/badge/Rust-CE422B?style=flat&logo=rust&logoColor=white)](https://rust-lang.org)
[![Infrastructure](https://img.shields.io/badge/Infrastructure-Tool-41CFFF?style=flat)](https://github.com/RECTOR-LABS)

</div>
