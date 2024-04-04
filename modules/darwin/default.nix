{ config, pkgs, ... }:

{
    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    system.stateVersion = 4;

    system.defaults.NSGlobalDomain."com.apple.swipescrolldirection" = false;
}