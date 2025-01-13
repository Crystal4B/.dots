{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.fonts.enable = lib.mkEnableOption "Enable fonts module";
  };

  config = lib.mkIf config.modules.fonts.enable {
    fonts = {
      enableDefaultPackages = true;
      packages = with pkgs; [
        noto-fonts
        nerd-fonts.fira-code
        nerd-fonts.fira-mono
      ];
    };
  };
}
