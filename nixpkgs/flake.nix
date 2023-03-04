{
  description = "My Flake that installs Home-Manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: let
    nonNixOSPackageSet = import nixpkgs {
      system = "x86_64-linux";
      overlays = [ home-manager.overlay ];
      config = {};
    };
  in {
    nixosModules = {};

    # Install Home-Manager with the non-NixOS package set
    homeConfigurations."fislysandi" = home-manager.buildHomeConfig {
      configuration = {
        home.packages = [];
        nixpkgs.config.allowUnfree = true;
        nixpkgs.config.allowUnsupportedSystem = true;
      };
      packages = nonNixOSPackageSet.pkgs;
      enable = true;
    };

    # Export home.nix as an output
    

    # Export imports for convenience
    imports = [ ./home.nix ];
      };
    
}
