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

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;
}
