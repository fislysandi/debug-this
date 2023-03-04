{
  description = "home-manager kickstart flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: let
    nonNixOSPackageSet = import nixpkgs {
      system = "x86_64-linux";
      overlays = [ home-manager.overlay ];
      config = {};
    };
  in {
    nixosModules = {};

    homeConfigurations."fislysandi" = home-manager.buildHomeConfig {
      configuration = {
        home.packages = [
          { path = "${./../nix}"; destination = "~/.config/nix"; }
          { path = "${././nixpkgs}"; destination = "~/.config/nixpkgs"; }
          { path = "${toString (builtins.replaceStrings "~" "~/dev/git" (toString config.homeManager.git.homeManager.configDir))}"; destination = "~/.config/nix_3drice"; }
        ];
      };
      packages = nonNixOSPackageSet.pkgs;
      enable = true;
    };

    imports = [ ./home.nix ];
  };
}
