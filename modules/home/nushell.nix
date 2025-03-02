{ config, lib, ... }:
{
  options = {
    modules.nushell.enable = lib.mkEnableOption "Enable nushell module";
  };

  config = lib.mkIf config.modules.nushell.enable {
    programs = {
      nushell = {
        enable = true;
        settings = {
          show_banner = false;
        };
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
