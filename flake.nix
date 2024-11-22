{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    # default = Darwin+Linux+x86+ARM, or default-linux, default-darwin, etc.
    # see https://github.com/nix-systems/
    systems.url = "github:nix-systems/default";
  };

  outputs = inputs@{ flake-parts, systems, ... }:
  flake-parts.lib.mkFlake { inherit inputs; } {
    systems = (import systems);
    perSystem = { config, self', inputs', pkgs, system, ... }: {};
    flake = {
      templates = {
        default = {
          path = ./default;
          description = ''
            base template, all systems, all attributes defined but empty
          '';
        };
        dev-shell = {
          path = ./dev-shell;
          description = ''
            defines a devShell for use with `nix develop` or `nix-shell`
            (through a compatibility shim in `shell.nix`)
          '';
        };
      };
    };
  };
}
