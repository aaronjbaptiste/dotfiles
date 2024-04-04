{ pkgs, ... }: {
    imports = [
        ../common
        ../modules/darwin/default.nix
    ];

    environment.systemPackages = [
        pkgs.vim
        pkgs.helix
    ];

    networking = {
        hostName = "Aarons-MacBook-Pro";
        computerName = "Aarons-MacBook-Pro";
    };

    services.nix-daemon.enable = true;

    programs.zsh.enable = true;

    nix.settings.experimental-features = "nix-command flakes";

    system.stateVersion = 4;

    nixpkgs.hostPlatform = "aarch64-darwin";
}