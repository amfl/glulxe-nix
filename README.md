# Glulxe for Nix

<https://github.com/erkyrath/glulxe> for the Nix package manager.

## Usage

1. Install Nix
2. Build nix expression

With legacy default.nix:

```sh
nix-build .
```

With flake.nix:

```sh
nix build '.#'
```

## References

- <https://sandervanderburg.blogspot.com/2014/07/managing-private-nix-packages-outside.html>
