{ config, lib, ... }:

with lib;

{
  options = {

    system.defaults.trackpad.TrackpadCornerSecondaryClick = pkgs.lib.mkOption {
        type = pkgs.lib.types.nullOr (pkgs.lib.types.enum [ 0 1 2 ]);
        default = null;
        description = pkgs.lib.mdDoc ''
            Set secondary click action.  The default is 0.
        '';
    };

  };
}