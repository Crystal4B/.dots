{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.tldr.enable = lib.mkEnableOption "Enable tldr module";
  };

  config = lib.mkIf config.modules.tldr.enable {
    environment.systemPackages = with pkgs; [
      tldr
    ];
  };
}
