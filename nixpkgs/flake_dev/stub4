{ pkgs ? import <nixpkgs> { } } : 

pkgs.mkShell {
  name = "nixsh";
  buildInputs = with pkgs; [
    nixFlakes
  ];
}
