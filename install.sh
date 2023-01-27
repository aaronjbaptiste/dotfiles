#!/usr/bin/env bash

################################################################################
# TODO
################################################################################

# Dont add -q to brew things when its set to verbose
# Add update param to update all software instead of install
# During upgrade if it it not installed, suggest running install version instead?
# Test homebrew install
# Add optional log files
# yabai config
# skhd config
# kitty config
# sketchybar
# setup dmenu
# starship config
# zsh config and oh-my install
# how to instll casks in this script
# gitconfig

################################################################################
# LOGGING
################################################################################

info() {
    if $VERBOSE; then
        local fmt="$1"
        shift
        # shellcheck disable=SC2059
        printf "\\n[INFO] $fmt\\n" "$@"
    fi
}

error() {
    local fmt="$1"
    shift
    # shellcheck disable=SC2059
    printf "\\n[ERROR] $fmt\\n" "$@"
    exit 1
}

################################################################################
# VARIABLE DECLARATIONS
################################################################################

VERBOSE=false

################################################################################
# USAGE
################################################################################

usage="\\nusage: $(basename "$0") [-h] [-v]

where:
    -h  show this help text
    -v  verbose logging"

while getopts "vh" opt; do
    case ${opt} in
    v) VERBOSE=true ;;
    h)
        echo -e "$usage"
        exit 0
        ;;
    *)
        error "$usage" >&2
        ;;
    esac
done

################################################################################
# Make sure we're on a Mac before continuing
################################################################################

if [ "$(uname)" != "Darwin" ]; then
    error "Oops, it looks like you're using a non-Darwin system. This script
only supports macOS. Exiting..."
fi

################################################################################
# START INSTALLS
################################################################################

set -e

if ! xcode-select -p &>/dev/null; then
    info "Installing xcode command line tools"
    touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
    PROD=$(softwareupdate -l |
        grep "\*.*Command Line" |
        tail -n 1 |
        sed -e "s/^* Label: //" |
        tr -d '\n')
    softwareupdate -i "$PROD" --agree-to-license >/dev/null
fi

if ! command -v brew &>/dev/null; then
    info "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    info "Brew already installed, updating instead"
    brew update
fi

# Helpers for installing via brew
install() {
    if ! command -v "$@" &>/dev/null; then
        brew install -q "$@" &>/dev/null
    fi
}

tap() {
    brew tap -q "$@" &>/dev/null
}

tap FelixKratz/formulae
install sketchybar

tap koekeishiya/formulae

install yabai

install skhd

install kitty

install node

brew cleanup

################################################################################
# MAC OS SETTINGS
################################################################################

info "Show hidden files"
defaults write com.apple.finder AppleShowAllFiles YES

info "Remove DS_Stores"
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

info "Removing applications from dock"
defaults write com.apple.dock static-only -bool true

info "Auto hide dock"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.2

info "Set the icon size of Dock items"
defaults write com.apple.dock tilesize -int 28

info "Disable magnification"
defaults write com.apple.dock magnification -bool false

info "Minimize windows into their applications icon"
defaults write com.apple.dock minimize-to-application -bool true

info "Disable animation when opening applications"
defaults write com.apple.dock launchanim -bool false

info "Disable Dashboard as an overlay"
defaults write com.apple.dock dashboard-in-overlay -bool false

info "Restart dock"
killall Dock

info "Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

info "Allow quitting via ⌘ + Q; doing so will also hide desktop icons"
defaults write com.apple.finder QuitMenuItem -bool true

info "Disable window and Get Info animations"
defaults write com.apple.finder DisableAllAnimations -bool true

info "Show all filename extension"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

info "Finder: show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

info "Finder: show path bar"
defaults write com.apple.finder ShowPathbar -bool true

info "Restart Finder"
killall Finder &>/dev/null
