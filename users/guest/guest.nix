{ pkgs, ... }:
{
  users.users.guest = {
    isNormalUser = true;
    description = "Guest";
    extraGroups = [
      "networkmanager"
      "bluetooth"
    ];
    shell = pkgs.zsh;
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.msek = import ./home.nix;
}
