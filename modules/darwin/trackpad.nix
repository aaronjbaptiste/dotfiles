{ config, lib, ... }:

with lib;

{
  options = {

    system.defaults.trackpad.TrackpadCornerSecondaryClick = mkOption {
        type = types.nullOr (types.enum [ 0 1 2 ]);
        default = null;
        description = lib.mdDoc ''
            Set secondary click action.  The default is 0.
        '';
    };

  };
}