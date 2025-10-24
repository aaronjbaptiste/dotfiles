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
~/.local/bin/yadm clone https://github.com/aaronjbaptiste/dotfiles.git --boostrap
rm -rf ~/.local/bin/yadm
```

Then Restart Mac.

## Post (optional)

1. Log in to iCloud
2. Generate SSH Key + Add public key to github
3. Configure git author

```
git config --global user.email "<email>"
git config --global user.name "<user_name>"
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
