{
  description = "Aarons configuration for MacOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, darwin, nixpkgs } @inputs:
  let
    sharedDarwinConfiguration = { pkgs, ... }: {

        # List packages installed in system profile. To search by name, run:
        # $ nix-env -qaP | grep wget
        environment.systemPackages = [
            pkgs.vim
            pkgs.helix
        ];

        # Auto upgrade nix package and the daemon service.
        services.nix-daemon.enable = true;

        # Create /etc/zshrc that loads the nix-darwin environment.
        programs.zsh.enable = true;  # default shell on catalina

         # Necessary for using flakes on this system.
        nix.settings.experimental-features = "nix-command flakes";

        # The platform the configuration will be used on.
        nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    darwinConfigurations."Aarons-MacBook-Pro" = darwin.lib.darwinSystem {
      system = "aaarch64-darwin";
      modules = [
        sharedDarwinConfiguration
        ./modules/darwin/default.nix
      ];
      specialArgs = { inherit inputs; };
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Aarons-MacBook-Pro".pkgs;
  };
}
