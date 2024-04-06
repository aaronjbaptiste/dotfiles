{
  description = "Aarons configuration for MacOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = { self, darwin, nixpkgs, nix-homebrew, homebrew-bundle, homebrew-core, homebrew-cask } @inputs:
  {
    darwinConfigurations = {
      # TODO: how to avoid this hardcoded hostname?
      sixstrings = darwin.lib.darwinSystem {
        system = "aaarch64-darwin";
        inherit inputs;

        modules = [
          ./modules/darwin/trackpad.nix
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              # Install Homebrew under the default prefix
              enable = true;

              user = "aaron";

              # Optional: Declarative tap management
              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
                "homebrew/homebrew-bundle" = homebrew-bundle;
              };

              # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
              mutableTaps = false;

              # Automatically migrate existing Homebrew installations
              autoMigrate = true;
            };
          }
          ./hosts/sixstrings/default.nix
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
