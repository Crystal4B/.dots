{ config, lib, pkgs, ... }:
{
    imports = [
        ../../modules/nixos
        ../../home/msek/msek.nix
    ];

    systems.wsl.enable = true;
    defaults.locale.enable = true;

    time.timeZone = "Europe/Dublin";

    networking.hostName = "veles";

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.backupFileExtension = "hm-backup";

    environment.systemPackages = with pkgs; [
        neovim
        git
        gnupg
        socat
    ];

    system.stateVersion = "24.05";
}

