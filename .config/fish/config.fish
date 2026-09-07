if status is-interactive
    fish_add_path /opt/homebrew/bin

    starship init fish | source
    proto activate fish | source
    atuin init fish | source
end

# Added by Antigravity
fish_add_path $HOME/.antigravity/antigravity/bin
set -gx PATH $HOME/.local/bin $PATH

# bun
set -gx BUN_INSTALL "$HOME/.bun"
set -gx PATH $BUN_INSTALL/bin $PATH
fish_add_path ~/.npm-global/bin
