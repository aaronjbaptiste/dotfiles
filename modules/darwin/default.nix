{ config, pkgs, ... }:

{
    system.defaults.NSGlobalDomain."com.apple.swipescrolldirection" = false;
    system.defaults.NSGlobalDomain."com.apple.mouse.tapBehavior" = 1;
    system.defaults.NSGlobalDomain."com.apple.trackpad.trackpadCornerClickBehavior" = 1;
    system.defaults.trackpad.TrackpadRightClick = true;
    system.defaults.trackpad.Clicking = 1;
    system.defaults.NSGlobalDomain."com.apple.trackpad.enableSecondaryClick" = true;

    homebrew = {
        enable = true;
        caskArgs.no_quarantine = true;
        casks = pkgs.callPackage ./casks.nix {};
    };
}