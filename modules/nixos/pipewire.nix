{ config, lib, ... }:
{
  options = {
    modules.pipewire.enable = lib.mkEnableOption "Enable pipewire module";
  };

  config = lib.mkIf config.modules.pipewire.enable {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      audio.enable = true;
      pulse.enable = true;
      jack.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };

    services.pulseaudio = {
      support32Bit = true;
    };
  };
}
