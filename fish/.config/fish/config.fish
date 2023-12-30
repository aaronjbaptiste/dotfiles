fish_config theme choose "Kanagawa"

if type -q exa
 alias ll "exa -l -g --icons"
 alias lla "ll -a"
 alias home "cd ~"
 alias .. "cd .."
end

alias g git

fish_add_path /opt/homebrew/bin
fish_add_path /Users/aaron/.volta/bin
starship init fish | source
pyenv init - | source
status --is-interactive; and source (pyenv virtualenv-init -|psub)

function nvm
   bass source $HOME/.nvm/nvm.sh --no-use ';' nvm $argv
end

