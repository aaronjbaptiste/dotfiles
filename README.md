# Dotfiles

My dotfiles, setup and project structure inspired by https://github.com/joshukraine/dotfiles

# New Mac Setup

1. Log in to iCloud
1. Check for Software Updates
1. Install Command Line Tools

```sh
xcode-select --install
```

## Run my thoughtbot laptop fork

https://github.com/aaronjbaptiste/laptop

1. Download the mac script

```sh
curl --remote-name https://raw.githubusercontent.com/aaronjbaptiste/laptop/main/mac
```

2. Download `.local.laptop` for additional customizations

```sh
curl --remote-name https://raw.githubusercontent.com/aaronjbaptiste/dotfiles/master/laptop/.laptop.local
```

3. Execute the `mac` script

```sh
sh mac 2>&1 | tee ~/laptop.log
```

## Setup dotfiles

```sh
git clone https://github.com/aaronjbaptiste/dotfiles.git ~/dotfiles
```

```sh
bash ~/dotfiles/setup.sh
```

## Install remaining Homebrew

```sh
brew bundle install
```




