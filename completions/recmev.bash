#!/usr/bin/env bash

# recmev bash completion script
# Generated for recMEV core

_recmev_completion() {
    local cur prev opts cmds
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    cmd=""
    opts=""

    # Get the current command chain
    local i=1
    while [[ "$i" -lt "$COMP_CWORD" ]]; do
        local s="${COMP_WORDS[i]}"
        case "$s" in
            -*) ;;
            *)
                cmd="$cmd $s"
                ;;
        esac
        (( i++ ))
    done
    
    # Basic commands
    local commands="trade swap about guide uninstall update install logs report config"
    
    # Command-specific flags and options
    case "$cmd" in
        " trade")
            opts="--pair -p"
            ;;
        " swap")
            if [[ "$cur" == -* ]]; then
                opts="--slippage -s --fee-type --priority-fee --use-sol --dynamic-compute-limit --dynamic-slippage"
            else
                # For positional arguments, just return without suggesting
                return 0
            fi
            ;;
        " uninstall")
            opts="--all -a"
            ;;
        " install")
            opts="--version -v --list -l"
            ;;
        " logs")
            opts="--lines -l --verbose -v --follow -f"
            ;;
        " report")
            opts="--description -d --lines -l --system-info -s"
            ;;
        " config")
            opts="--show -s --log-path --log-status --solana-rpc-url --secure-key-input --wallet-keyfile --encrypt-key --clear-key --model-checkpoint-dir --optimization-rounds --max-concurrent-trades --log-level --ipc-port --ipc-host --max-slippage-bps --priority-fee-type --priority-fee-sol --use-wsol --dynamic-compute-limit --dynamic-slippage"
            ;;
        " about" | " guide" | " update")
            # No options for these commands
            ;;
        "")
            # Main commands
            opts="$commands"
            ;;
        *)
            # Unknown command
            ;;
    esac

    # Handle completion for specific option values
    case "$prev" in
        --pair|-p)
            # Suggest common trading pairs
            COMPREPLY=( $(compgen -W "SOL/USDC SOL/USDT ETH/USDC BTC/USDC" -- "$cur") )
            return 0
            ;;
        --log-level)
            # Log level options
            COMPREPLY=( $(compgen -W "ERROR WARN INFO DEBUG TRACE" -- "$cur") )
            return 0
            ;;
        --fee-type|--priority-fee-type)
            # Priority fee types
            COMPREPLY=( $(compgen -W "max_cap exact_fee jito" -- "$cur") )
            return 0
            ;;
        --use-wsol|--dynamic-compute-limit|--dynamic-slippage)
            # Boolean options
            COMPREPLY=( $(compgen -W "true false" -- "$cur") )
            return 0
            ;;
        --wallet-keyfile)
            # List json files
            COMPREPLY=( $(compgen -f -X '!*.json' -- "$cur") )
            return 0
            ;;
        --model-checkpoint-dir)
            # Directories
            COMPREPLY=( $(compgen -d -- "$cur") )
            return 0
            ;;
    esac

    # Complete using the computed options
    if [[ ${cur} == -* ]]; then
        # Complete options
        COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
        return 0
    fi

    # Complete commands or subcommands
    COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
    return 0
}

# Register the completion function
complete -F _recmev_completion recmev 