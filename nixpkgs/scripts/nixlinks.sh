#!/bin/bash

# Get the root path of the project
ROOT="$(pwd | rev | cut -d '/' -f 3- | rev)"

# Define the paths to the nix and nixpkgs folders
nixpkgs_path="$ROOT/nixpkgs"
nix_path="$ROOT/nix"

# Define the paths to the existing symlinks
nixpkgs_link="$HOME/.config/nixpkgs"
nix_link="$HOME/.config/nix"

# Check if the symlinks exist and are correct, otherwise remove them
if [[ -L $nixpkgs_link && "$(readlink $nixpkgs_link)" == "$nixpkgs_path" ]]; then
    echo "$nixpkgs_link already exists and is correct"
else
    rm -rf $nixpkgs_link
    ln -s $nixpkgs_path $nixpkgs_link
    echo "Symlink created for nixpkgs"
fi

if [[ -L $nix_link && "$(readlink $nix_link)" == "$nix_path" ]]; then
    echo "$nix_link already exists and is correct"
else
    rm -rf $nix_link
    ln -s $nix_path $nix_link
    echo "Symlink created for nix"
fi
