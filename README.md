# Dotfiles

Full MacOS system setup using [Nix](https://github.com/NixOS/nix) and [Nix-Darwin](https://github.com/LnL7/nix-darwin)

## Fresh Mac Installation

1. Log in to iCloud
2. System Settings > General > Software update
2. Run this:

Run at your own risk, please review the source before running random scripts:

```sh
curl -fsSL -o install_script.sh https://raw.githubusercontent.com/aaronjbaptiste/dotfiles/main/install
chmod +x install_script.sh
./install_script.sh
rm ./install_script.sh
```

## Updating

The repo for the script above will have been cloned into ~/.dotfiles and can be safetly run multiple times:

```sh
cd ~/.dotfiles
git pull
chmod +x install && ./install
```

## What does this do?

- [x] Installs Command Line Tools silently
- [x] Installs [Nix](https://github.com/NixOS/nix)
- [x] Installs [Nix-Darwin](https://github.com/LnL7/nix-darwin)
- [x] Clones this repo
- [x] Initiates the setup

## Todo

- [] Read username (currently hardcoded)
- [] Read hostname (currently hardcoded)

## Credits

[matchai](https://github.com/matchai/dotfiles)