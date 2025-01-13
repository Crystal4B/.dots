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
}
