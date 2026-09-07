# Mac Setup Script

My setup and dotfiles - managed by [yadm](https://yadm.io/).

## Pre

```
# Ensure macOS is updated
sudo softwareupdate -i -a

# Ensure Apple's command line tools are installed
xcode-select --install
```

## How to run

```
mkdir -p ~/.local/bin
curl -fLo ~/.local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm
chmod a+x ~/.local/bin/yadm
~/.local/bin/yadm clone https://github.com/aaronjbaptiste/dotfiles.git --no-bootstrap
```

Set this machine's class **before** bootstrapping - it controls which
Brewfile and npm/proto steps run (see `.config/yadm/bootstrap.d`):

```
yadm config local.class work      # or: personal
```

This is local-only config, never pushed to the repo, so it has to be set
on every new machine.

```
yadm bootstrap
rm -rf ~/.local/bin/yadm
```

Then Restart Mac.

## Post (optional)

1. Log in to iCloud
2. Disable Spotlight Keyboard shortcut (we replace it with Raycast)

```
System Settings > Keyboard > Keyboard Shortcuts > Spotlight > Show Spotlight search
```

3. Generate SSH Key + Add public key to github
4. Configure git author

```
git config --global user.email "<email>"
git config --global user.name "<user_name>"
```

5. Change origin to ssh so we can push back

```
yadm remote set-url origin git@github.com:aaronjbaptiste/dotfiles.git
```

## How to push changes

```
yadm add <important file|folder>
yadm commit
yadm push
```

## How to update

```
yadm pull --rebase
yadm bootstrap
```
