#compdef recmev

# ZSH Completion function for recMEV
# Generated for recMEV core

_recmev() {
    local curcontext="$curcontext" state line
    typeset -A opt_args

    # Define the main commands
    local -a commands
    commands=(
        'trade:Execute an arbitrage trade'
        'swap:Execute a token swap using Jupiter'
        'about:Display information about recMEV'
        'guide:Show a beginner-friendly guide to using recMEV'
        'uninstall:Uninstall recmev from the system'
        'update:Check for updates and install the latest version'
        'install:Install a specific version of recmev'
        'logs:Show logs with detailed error information and context'
        'report:Report an error or issue'
        'config:Configure recmev settings'
    )

    # Define the arguments for each main command
    local -a trade_args
    trade_args=(
        '--pair[The trading pair to execute the arbitrage on]:pair:'
        '-p[The trading pair to execute the arbitrage on]:pair:'
    )

    local -a swap_args
    swap_args=(
        '--slippage[Maximum slippage in basis points (1 bps = 0.01%)]:slippage:'
        '-s[Maximum slippage in basis points (1 bps = 0.01%)]:slippage:'
        '--fee-type[Type of priority fee to use (max_cap, exact_fee, jito)]:fee type:(max_cap exact_fee jito)'
        '--priority-fee[Priority fee in SOL]:fee:'
        '--use-sol[Use native SOL instead of wrapped SOL]'
        '--dynamic-compute-limit[Enable dynamic compute limit]'
        '--dynamic-slippage[Enable dynamic slippage]'
    )

    local -a uninstall_args
    uninstall_args=(
        '--all[Delete all data including logs and config files (clean uninstall)]'
        '-a[Delete all data including logs and config files (clean uninstall)]'
    )

    local -a install_args
    install_args=(
        '--version[Specific version to install (e.g., "0.13.10")]:version:'
        '-v[Specific version to install (e.g., "0.13.10")]:version:'
        '--list[List available versions without installing]'
        '-l[List available versions without installing]'
    )

    local -a logs_args
    logs_args=(
        '--lines[Number of lines to show]:lines:'
        '-l[Number of lines to show]:lines:'
        '--verbose[Show full log details in JSON format]'
        '-v[Show full log details in JSON format]'
        '--follow[Continuously tail the log file]'
        '-f[Continuously tail the log file]'
    )

    local -a report_args
    report_args=(
        '--description[Optional description of the issue]:description:'
        '-d[Optional description of the issue]:description:'
        '--lines[Number of recent log lines to include]:lines:'
        '-l[Number of recent log lines to include]:lines:'
        '--system-info[Include system information in the report]'
        '-s[Include system information in the report]'
    )

    local -a config_args
    config_args=(
        '--show[Show current configuration]'
        '-s[Show current configuration]'
        '--log-path[Display the current log file path]'
        '--log-status[Display logging status and configuration]'
        '--solana-rpc-url[Set Solana RPC URL]:url:'
        '--secure-key-input[Securely input wallet private key (prompts for input)]'
        '--wallet-keyfile[Set wallet key from JSON keyfile]:filename:_files'
        '--encrypt-key[Encrypt existing wallet key with a password]'
        '--clear-key[Clear all wallet keys (both encrypted and plaintext)]'
        '--model-checkpoint-dir[Set model checkpoint directory]:directory:_files -/'
        '--optimization-rounds[Set optimization rounds]:rounds:'
        '--max-concurrent-trades[Set maximum concurrent trades]:trades:'
        '--log-level[Set log level]:level:(ERROR WARN INFO DEBUG TRACE)'
        '--ipc-port[Set IPC port]:port:'
        '--ipc-host[Set IPC host]:host:'
        '--max-slippage-bps[Set maximum slippage for Jupiter swaps (in basis points)]:slippage:'
        '--priority-fee-type[Set priority fee type for Jupiter swaps]:type:(max_cap exact_fee jito)'
        '--priority-fee-sol[Set priority fee amount for Jupiter swaps (in SOL)]:fee:'
        '--use-wsol[Enable or disable wrapping SOL for Jupiter swaps]:bool:(true false)'
        '--dynamic-compute-limit[Enable or disable dynamic compute unit limit for Jupiter swaps]:bool:(true false)'
        '--dynamic-slippage[Enable or disable dynamic slippage for Jupiter swaps]:bool:(true false)'
    )

    # Define the state machine
    _arguments -C \
        '1: :->command' \
        '*:: :->args'

    case $state in
        command)
            _describe -t commands 'recmev commands' commands
            ;;
        args)
            case $line[1] in
                trade)
                    _arguments ${trade_args[@]}
                    ;;
                swap)
                    # Special handling for swap positional arguments
                    if (( CURRENT == 2 )); then
                        _message "input_mint (token address to sell)"
                    elif (( CURRENT == 3 )); then
                        _message "output_mint (token address to buy)"
                    elif (( CURRENT == 4 )); then
                        _message "amount (amount to swap)"
                    else
                        _arguments ${swap_args[@]}
                    fi
                    ;;
                uninstall)
                    _arguments ${uninstall_args[@]}
                    ;;
                install)
                    _arguments ${install_args[@]}
                    ;;
                logs)
                    _arguments ${logs_args[@]}
                    ;;
                report)
                    _arguments ${report_args[@]}
                    ;;
                config)
                    _arguments ${config_args[@]}
                    ;;
                about|guide|update)
                    # No arguments for these commands
                    ;;
            esac
            ;;
    esac
}

_recmev "$@" 