{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay/7d3d910d5fd575e6e8c5600d83d54e5c47273bfe";
  };

  outputs =
    {
      self,
      nixpkgs,
      rust-overlay,
    }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux.pkgs;
      overlays = [ (import rust-overlay) ];
    in
    {
      devShells.x86_64-linux.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [ ];
      };
    };
}
