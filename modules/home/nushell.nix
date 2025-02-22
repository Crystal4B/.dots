{ config, lib, ... }:
{
  options = {
    modules.nushell.enable = lib.mkEnableOption "Enable nushell module";
  };

  config = lib.mkIf config.modules.nushell.enable {
    programs = {
      nushell = {
        enable = true;
      };

      carapace = {
        enable = true;
        enableNushellIntegration = true;
      };

      starship = {
        enable = true;
        enableNushellIntegration = true;
      };
    };
  };
}
