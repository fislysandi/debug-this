{
 description = "Your new nix config";

  # Determine hostname and username dynamically
  inputs = {
    hostname = builtins.readFile "/etc/hostname";
    username = builtins.getEnv "USER";

    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";

    # NixGL
    nixgl.url = "github:numtide/nixgl";
    nixgl.inputs.nixpkgs.follows = "nixpkgs";

    # Cachix
    cachix.url = "github:cachix/cachix";
    cachix.inputs.nixpkgs.follows = "nixpkgs";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixgl, cachix, home-manager }@inputs: {
    nixosConfigurations = {
      ${inputs.hostname} = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # Your NixOS configuration modules go here
        ];
        # Pass inputs to NixOS configuration
        specialArgs = { inherit inputs; };
      };
    };

    homeConfigurations.${inputs.username}.${inputs.hostname} = home-manager.lib.homeManagerConfiguration {
      # Use nixpkgs from input
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      # Your Home Manager configuration modules go here
      modules = [

      ./home.nix
      ];

      # Pass inputs to Home Manager configuration
      extraSpecialArgs = { inherit inputs; };
    };
  };
}
