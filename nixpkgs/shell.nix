{ pkgs ? import <nixpkgs> { } } : 

pkgs.mkShell {
  name = "nixsh";
  buildInputs = with pkgs; [
    git
    tmux
  ];
}
