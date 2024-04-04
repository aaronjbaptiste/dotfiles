{ config, pkgs, ... }:

{
    system.defaults.NSGlobalDomain."com.apple.swipescrolldirection" = false;

    homebrew = {
        enable = true;
        caskArgs.no_quarantine = true;
        casks = pkgs.callPackage ./casks.nix {};
    };
}