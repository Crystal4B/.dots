{ config, lib, ... }:
{
  options = {
    modules.nvidia.enable = lib.mkEnableOption "Enable nvidia module";
  };

  config = lib.mkIf config.modules.nvidia.enable {
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware = {
      # OpenGL
      graphics.enable = true;
      graphics.enable32Bit = true;

      # Most wayland compositors need this
      nvidia.modesetting.enable = true;
    };

    hardware.nvidia = {
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
