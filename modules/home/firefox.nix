{
  inputs,
  config,
  lib,
  ...
}:
{
  imports = [ inputs.textfox.homeManagerModules.default ];

  options = {
    modules.firefox.enable = lib.mkEnableOption "Enable Firefox module";
  };

  config = lib.mkIf config.modules.firefox.enable {
    textfox = {
      enable = true;
      profile = "msek";
    };
  };
}
