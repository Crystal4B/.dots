{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.bluetooth.enable = lib.mkEnableOption "Enable bluetooth module";
  };

  config = lib.mkIf config.modules.bluetooth.enable {
    environment.systemPackages = with pkgs; [
      bluez
      bluez-tools
      blueman
    ];

    hardware.xpadneo.enable = true;

    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;

      package = pkgs.bluez;
      settings.Policy.AutoEnable = "true";

    };

    services.blueman.enable = true;

    boot.extraModprobeConfig = "options bluetooth disable_ertm=1";
  };
}
