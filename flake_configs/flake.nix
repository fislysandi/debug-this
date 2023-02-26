{
  description = "st terminal emulator";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    st.url = "git+https://git.suckless.org/st";
  };

  outputs = { self, nixpkgs, st }:
    let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          (self.st.overrideAttrs (oldAttrs: {
            name = "st";
            src = self.st;
            buildInputs = oldAttrs.buildInputs ++ [ pkgs.makeWrapper ];
            makeFlags = [ "X11LIB=-L${pkgs.xorg.lib}/../lib" ];
          }))
        ];
      };
    in
    {
      packages.x86_64-linux.st = pkgs.st;
      defaultPackage.x86_64-linux = pkgs.st;
    };
}

