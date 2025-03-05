{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.touchpad.enable = lib.mkEnableOption "Enable touchpad module";
  };

  config = lib.mkIf config.modules.touchpad.enable {
    environment.systemPackages = with pkgs; [
      libinput
      libinput-gestures
      wmctrl
      xdotool
    ];

    services = {
      xserver.windowManager.fvwm2.gestures = true;
      libinput = {
        enable = true;
        touchpad = {
          middleEmulation = true;
          naturalScrolling = true;
          tapping = true;
        };
      };
    };
  };
}
