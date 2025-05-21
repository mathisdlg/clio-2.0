{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShellNoCC {
    name = "Clio 2.0 dev shell";

    nativeBuildInputs = with pkgs.buildPackages; [
        arduino-cli
    ];
}