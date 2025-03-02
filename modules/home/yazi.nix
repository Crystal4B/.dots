{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.yazi.enable = lib.mkEnableOption "Enable Yazi module";
  };

  config = lib.mkIf config.modules.yazi.enable {
    home.packages = with pkgs; [
      yazi
    ];

    home.file.".config/yazi".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/dotfiles/linux/.config/yazi";
  };
}
