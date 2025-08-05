{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.sops.enable = lib.mkEnableOption "Enable sops module";
  };

  config = lib.mkIf config.modules.sops.enable {
    home.packages = with pkgs; [
      sops
    ];

    home.file.".config/sops/age/keys.txt" = {
      source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/sops/age/keys.txt";
    };
  };
}
