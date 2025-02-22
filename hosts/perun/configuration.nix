{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../common.nix
  ];

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    useOSProber = true;
    efiSupport = true;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "perun";

  system.stateVersion = "25.05";
}
