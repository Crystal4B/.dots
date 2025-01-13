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

    services.blueman.enable = true;

    hardware = {
      xpadneo.enable = true;
      steam-hardware.enable = true;
      bluetooth = {
        enable = true;
        powerOnBoot = true;
        settings.General = {
          experimental = true;

          # https://www.reddit.com/r/NixOS/comments/1ch5d2p/comment/lkbabax/
          # for pairing bluetooth controller
          Privacy = "device";
          JustWorksRepairing = "always";
          Class = "0x000100";
          FastConnectable = true;
        };

        package = pkgs.bluez;
        settings.Policy.AutoEnable = "true";
      };
    };

    boot = {
      extraModulePackages = with config.boot.kernelPackages; [ xpadneo ];
      extraModprobeConfig = "options bluetooth disable_ertm=1";
    };
  };
}
