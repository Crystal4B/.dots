{ pkgs, config, ... }:
{
    nixpkgs.config.allowUnfree = true;

    users.users.msek = {
        isNormalUser = true;
        description = "Marcin Sęk";
        extraGroups = [ "networkmanager" "wheel" "bluetooth" ];
    };

    environment.variables = {
        EDITOR = "nvim";
    };

    home-manager.users.msek = import ./home.nix;
}

