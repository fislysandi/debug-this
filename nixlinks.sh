#!/bin/bash

# Make sure we are in the directory that contains the folders
cd "$(dirname "$0")"

# Create symlink for nixpkgs folder
ln -s "$(pwd)/nixpkgs" "$HOME/.config/nixpkgs"

# Create symlink for nix folder
ln -s "$(pwd)/nix" "$HOME/.config/nix"
