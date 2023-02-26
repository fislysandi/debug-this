{
  description = "My personal Nix config";
   inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    home-manager.url = "github:nix-community/home-manager/release-22.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, home-manager, }: {
    nixosConfigurations = { };
    pkgs = nixpkgs;
    home-manager.x86_64-linux = import home-manager {
      inherit pkgs;
    };
    defaultPackage.x86_64-linux = home-manager;
    defaultApp.x86_64-linux = home-manager.desktop;
  };
}
