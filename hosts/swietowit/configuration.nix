{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../common.nix

    ../../modules/nixos
  ];

  modules = {
    asus.enable = true;
    touchpad.enable = true;
  };

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "swietowit";

  system.stateVersion = "25.05";
}
