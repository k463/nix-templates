# nix-templates

My (opinionated) nix flake templates for various projects.

Using:

- [flake-parts](https://github.com/hercules-ci/flake-parts)
- [flakehub](https://flakehub.com/)

## templates

- [default](./default/): base template, all systems, all attributes defined but
  empty
- [dev-shell](./dev-shell/): defines a devShell for use with `nix develop` or
  `nix-shell` (through a compatibility shim in `shell.nix`)

## usage

List available templates:

``` sh
nix flake show github:k463/nix-templates
```

Copy default template into a project in current directory:

``` sh
nix flake init -t github:k463/nix-templates
```

Copy dev-shell template into a project in current directory:

``` sh
nix flake init -t github:k463/nix-templates#dev-shell
```
