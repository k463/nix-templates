{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.*.tar.gz";
    # default = Darwin+Linux+x86+ARM, or default-linux, default-darwin, etc.
    # see https://github.com/nix-systems/
    systems.url = "github:nix-systems/default";
  };

  outputs = inputs@{ flake-parts, systems, ... }:
  flake-parts.lib.mkFlake { inherit inputs; } {
    imports = [];
    systems = (import systems);
    perSystem = { config, self', inputs', pkgs, system, ... }: {};
    flake = {};
  };
}
