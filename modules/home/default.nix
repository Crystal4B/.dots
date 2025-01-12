{ pkgs, lib, ... }:
{
    imports = [
        ./neovim.nix
        ./nushell.nix
        ./yazi.nix
    ];
}

