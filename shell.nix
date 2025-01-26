let
  # We pin to a specific nixpkgs commit for reproducibility.
  # Last updated: 2024-04-29. Check for new commits at https://status.nixos.org.
  pkgs = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/cf8cc1201be8bc71b7cbbbdaf349b22f4f99c7ae.tar.gz";
    sha256 = "sha256:1x7nca1ij9snsb2pqqzfawzgpc1b1d5js9m7b78lmql54ayixl68";
  }) { };
in
pkgs.mkShell {
  packages = [
    (pkgs.python3.withPackages (
      python-pkgs: with python-pkgs; [
        # select Python packages here
        pandas
        requests
        autopep8
        flake8
        black
      ]
    ))
  ];
}
