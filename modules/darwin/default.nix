{ config, pkgs, ... }:

{
    system.defaults.NSGlobalDomain."com.apple.swipescrolldirection" = false;

    homebrew = {
        enable = true;
        casks = pkgs.callPackage ./casks.nix {};
    };
}