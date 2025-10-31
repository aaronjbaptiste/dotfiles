if status is-interactive
    fish_add_path /opt/homebrew/bin

    starship init fish | source
    proto activate fish | source
    atuin init fish | source
end
