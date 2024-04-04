{ config, pkgs, ... }:

{
    system.defaults.NSGlobalDomain."com.apple.swipescrolldirection" = false;

    homebrew = {
        enable = true;
        taps = [ "homebrew/cask-versions" ];
        casks = pkgs.callPackage ./casks.nix {};
    };
}