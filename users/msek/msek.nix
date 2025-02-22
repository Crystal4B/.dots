{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  users.users.msek = {
    isNormalUser = true;
    description = "Marcin Sęk";
    extraGroups = [
      "networkmanager"
      "wheel"
      "bluetooth"
    ];
    shell = pkgs.nushell;
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.msek = import ./home.nix;
}
