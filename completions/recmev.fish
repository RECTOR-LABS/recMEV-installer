# Fish completion for recMEV
# Generated for recMEV core

# Main commands
complete -c recmev -f -n "__fish_use_subcommand" -a "trade" -d "Execute an arbitrage trade"
complete -c recmev -f -n "__fish_use_subcommand" -a "swap" -d "Execute a token swap using Jupiter"
complete -c recmev -f -n "__fish_use_subcommand" -a "about" -d "Display information about recMEV"
complete -c recmev -f -n "__fish_use_subcommand" -a "guide" -d "Show a beginner-friendly guide to using recMEV"
complete -c recmev -f -n "__fish_use_subcommand" -a "uninstall" -d "Uninstall recmev from the system"
complete -c recmev -f -n "__fish_use_subcommand" -a "update" -d "Check for updates and install the latest version"
complete -c recmev -f -n "__fish_use_subcommand" -a "install" -d "Install a specific version of recmev"
complete -c recmev -f -n "__fish_use_subcommand" -a "logs" -d "Show logs with detailed error information and context"
complete -c recmev -f -n "__fish_use_subcommand" -a "report" -d "Report an error or issue"
complete -c recmev -f -n "__fish_use_subcommand" -a "config" -d "Configure recmev settings"

# Options for 'trade' command
complete -c recmev -f -n "__fish_seen_subcommand_from trade" -s p -l "pair" -d "The trading pair to execute the arbitrage on"

# Options for 'swap' command
complete -c recmev -f -n "__fish_seen_subcommand_from swap" -s s -l "slippage" -d "Maximum slippage in basis points (1 bps = 0.01%)"
complete -c recmev -f -n "__fish_seen_subcommand_from swap" -l "fee-type" -d "Type of priority fee to use" -a "max_cap exact_fee jito"
complete -c recmev -f -n "__fish_seen_subcommand_from swap" -l "priority-fee" -d "Priority fee in SOL"
complete -c recmev -f -n "__fish_seen_subcommand_from swap" -l "use-sol" -d "Use native SOL instead of wrapped SOL"
complete -c recmev -f -n "__fish_seen_subcommand_from swap" -l "dynamic-compute-limit" -d "Enable dynamic compute limit"
complete -c recmev -f -n "__fish_seen_subcommand_from swap" -l "dynamic-slippage" -d "Enable dynamic slippage"

# Options for 'uninstall' command
complete -c recmev -f -n "__fish_seen_subcommand_from uninstall" -s a -l "all" -d "Delete all data including logs and config files (clean uninstall)"

# Options for 'install' command
complete -c recmev -f -n "__fish_seen_subcommand_from install" -s v -l "version" -d "Specific version to install (e.g., \"0.13.10\")"
complete -c recmev -f -n "__fish_seen_subcommand_from install" -s l -l "list" -d "List available versions without installing"

# Options for 'logs' command
complete -c recmev -f -n "__fish_seen_subcommand_from logs" -s l -l "lines" -d "Number of lines to show"
complete -c recmev -f -n "__fish_seen_subcommand_from logs" -s v -l "verbose" -d "Show full log details in JSON format"
complete -c recmev -f -n "__fish_seen_subcommand_from logs" -s f -l "follow" -d "Continuously tail the log file"

# Options for 'report' command
complete -c recmev -f -n "__fish_seen_subcommand_from report" -s d -l "description" -d "Optional description of the issue"
complete -c recmev -f -n "__fish_seen_subcommand_from report" -s l -l "lines" -d "Number of recent log lines to include"
complete -c recmev -f -n "__fish_seen_subcommand_from report" -s s -l "system-info" -d "Include system information in the report"

# Options for 'config' command
complete -c recmev -f -n "__fish_seen_subcommand_from config" -s s -l "show" -d "Show current configuration"
complete -c recmev -f -n "__fish_seen_subcommand_from config" -l "log-path" -d "Display the current log file path"
complete -c recmev -f -n "__fish_seen_subcommand_from config" -l "log-status" -d "Display logging status and configuration"
complete -c recmev -f -n "__fish_seen_subcommand_from config" -l "solana-rpc-url" -d "Set Solana RPC URL"
complete -c recmev -f -n "__fish_seen_subcommand_from config" -l "secure-key-input" -d "Securely input wallet private key (prompts for input)"
complete -c recmev -f -n "__fish_seen_subcommand_from config" -l "wallet-keyfile" -d "Set wallet key from JSON keyfile"
complete -c recmev -f -n "__fish_seen_subcommand_from config" -l "encrypt-key" -d "Encrypt existing wallet key with a password"
complete -c recmev -f -n "__fish_seen_subcommand_from config" -l "clear-key" -d "Clear all wallet keys (both encrypted and plaintext)"
complete -c recmev -f -n "__fish_seen_subcommand_from config" -l "model-checkpoint-dir" -d "Set model checkpoint directory"
complete -c recmev -f -n "__fish_seen_subcommand_from config" -l "optimization-rounds" -d "Set optimization rounds"
complete -c recmev -f -n "__fish_seen_subcommand_from config" -l "max-concurrent-trades" -d "Set maximum concurrent trades"
complete -c recmev -f -n "__fish_seen_subcommand_from config" -l "log-level" -d "Set log level" -a "ERROR WARN INFO DEBUG TRACE"
complete -c recmev -f -n "__fish_seen_subcommand_from config" -l "ipc-port" -d "Set IPC port"
complete -c recmev -f -n "__fish_seen_subcommand_from config" -l "ipc-host" -d "Set IPC host"
complete -c recmev -f -n "__fish_seen_subcommand_from config" -l "max-slippage-bps" -d "Set maximum slippage for Jupiter swaps (in basis points)"
complete -c recmev -f -n "__fish_seen_subcommand_from config" -l "priority-fee-type" -d "Set priority fee type for Jupiter swaps" -a "max_cap exact_fee jito"
complete -c recmev -f -n "__fish_seen_subcommand_from config" -l "priority-fee-sol" -d "Set priority fee amount for Jupiter swaps (in SOL)"
complete -c recmev -f -n "__fish_seen_subcommand_from config" -l "use-wsol" -d "Enable or disable wrapping SOL for Jupiter swaps" -a "true false"
complete -c recmev -f -n "__fish_seen_subcommand_from config" -l "dynamic-compute-limit" -d "Enable or disable dynamic compute unit limit for Jupiter swaps" -a "true false"
complete -c recmev -f -n "__fish_seen_subcommand_from config" -l "dynamic-slippage" -d "Enable or disable dynamic slippage for Jupiter swaps" -a "true false" 