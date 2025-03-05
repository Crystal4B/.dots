{
  config,
  lib,
  ...
}:
{
  options = {
    modules.neovim.enable = lib.mkEnableOption "Enable neovim module";
  };

  config = lib.mkIf config.modules.neovim.enable {
    environment.sessionVariables = {
      NIXOS_SYSTEM = "true";
    };

    programs.neovim = {
      enable = true;
      defaultEditor = true;

      viAlias = true;
      vimAlias = true;
    };
  };
}
