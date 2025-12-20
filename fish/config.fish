## 🐟 Modern Fish Shell Config

# ──────────────────────────────
# Greeting (cowsay + fortune)
# ──────────────────────────────
function fish_greeting
    # if type -q fortune > /dev/null; and type -q cowsay > /dev/null
    #     # List of cows
    #     set cows \
    #         apt bud-frogs bunny calvin cheese cock cower daemon default \
    #         dragon-and-cow dragon duck elephant-in-snake elephant eyes \
    #         flaming-sheep fox ghostbusters gnu hellokitty kangaroo kiss \
    #         koala kosh luke-koala mech-and-cow milk moofasa moose \
    #         pony-smaller pony ren skeleton snowman stegosaurus stimpy \
    #         suse three-eyes turkey turtle tux unipony-smaller unipony \
    #         vader-koala vader www

    #     # Randomly pick one
    #     set selected_cow $cows[(random 1 (count $cows))]

    #     # Show fortune in cowsay
    #     fortune | cowsay -f $selected_cow
    # else
    #     echo "Welcome back to Fish!"
    #     echo "Tip: Install 'fortune' and 'cowsay' for a fun greeting."
    # end

end

# ──────────────────────────────
# Modern ls using exa
# ──────────────────────────────
function ls
    if type -q exa
        exa --color=auto --git --icons --group-directories-first $argv
    else
        command ls --color=auto $argv
    end
end
alias ll='ls -lh'

# ──────────────────────────────
# Modern cat using bat
# ──────────────────────────────
function cat
    if type -q batcat
        batcat $argv
    else
        command cat $argv
    end
end

# ──────────────────────────────
# Grep with colors (ripgrep)
# ──────────────────────────────
function grep
    if type -q rg
        rg --color=auto $argv
    else
        command grep --color=auto $argv
    end
end

# ──────────────────────────────
# Dust 
# ──────────────────────────────
function du
    if type -q dust
        dust $argv
    else
        command du $argv
    end
end

# ──────────────────────────────
# Git shortcuts
# ──────────────────────────────
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --all'

# ──────────────────────────────
# Handy navigation aliases
# ──────────────────────────────
alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'

# ──────────────────────────────
# Add Composer global bin to PATH
# ──────────────────────────────
fish_add_path ~/.config/composer/vendor/bin

# ──────────────────────────────
# Starship prompt
# ──────────────────────────────
starship init fish | source

# ──────────────────────────────
# Interactive-only commands
# ──────────────────────────────
if status is-interactive

    # Fastfetch system info at start
    # if type -q fastfetch
    #     fastfetch
    # else
    #     echo "install fastfetch to get fastfetch output at start"
    # end

    # Fuzzy finder (fzf) key bindings
    if type -q fzf
        # Ctrl-R for history search
        bind \cr fzf-history-widget
        # Ctrl-T for file search
        bind \ct fzf-file-widget
    end

end

# Kitty shell integration
if set -q KITTY_INSTALLATION_DIR
    source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
end
