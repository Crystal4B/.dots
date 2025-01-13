{ config, lib, ... }:
{
  options = {
    modules.zsh.enable = lib.mkEnableOption "Enable zsh module";
  };

  config = lib.mkIf config.modules.zsh.enable {
    programs.zsh.enable = true;
  };
}
