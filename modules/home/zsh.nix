{ config, lib, ... }:
{
  options = {
    modules.zsh.enable = lib.mkEnableOption "Enable zsh module";
  };

  config = lib.mkIf config.modules.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
    };

    programs.starship = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
