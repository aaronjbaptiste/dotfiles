{ pkgs, ... }:
{
  imports = [
    ../common
    ../../modules/darwin/default.nix
  ];

  environment.systemPackages = [
    pkgs.vim
    pkgs.helix
    pkgs.vscode
    pkgs.nixfmt
  ];

  networking = {
    hostName = "sixstrings";
    computerName = "sixstrings";
  };

  services.nix-daemon.enable = true;

  programs.zsh.enable = true;

  nix.settings.experimental-features = "nix-command flakes";

  system.stateVersion = 4;

  system.defaults.dock = {
    appswitcher-all-displays = true;
    autohide = true;
    autohide-delay = 0.0;
    autohide-time-modifier = 0.15;
    dashboard-in-overlay = false;
    enable-spring-load-actions-on-all-items = false;
    expose-animation-duration = 0.2;
    expose-group-by-app = false;
    launchanim = true;
    mineffect = "genie";
    minimize-to-application = false;
    mouse-over-hilite-stack = true;
    mru-spaces = false;
    orientation = "bottom";
    show-process-indicators = true;
    show-recents = true;
    showhidden = true;
    static-only = false;
    tilesize = 48;
    wvous-bl-corner = 1;
    wvous-br-corner = 1;
    wvous-tl-corner = 1;
    wvous-tr-corner = 1;
    persistent-apps = [
      "/Applications/Nix Apps/Visual Studio Code.app"
      "/Applications/Rider.app"
    ];
  };

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;
}
