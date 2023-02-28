{
  description = "A flake that installs Luke Smith's st terminal";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-22.11";
  };
  outputs = { self, nixpkgs }: {
    st = nixpkgs.mkShell {
      name = "luke-smith-st";
      buildInputs = [
        nixpkgs.cmake
        nixpkgs.pkgconfig
        nixpkgs.libX11
        nixpkgs.libXft
        nixpkgs.libXext
        nixpkgs.xorg.libXrender
        nixpkgs.fontconfig
        nixpkgs.harfbuzz
        nixpkgs.freetype
      ];
      shellHook = ''
        git clone https://github.com/LukeSmithxyz/st.git
        cd st
        git checkout luke
        make
        make install
      '';
    };
  };
}
