{
  pkgs,
  inputs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.zen.enable = lib.mkEnableOption "Enable zen module";
  };

  config = lib.mkIf config.modules.zen.enable {
    environment.systemPackages = with pkgs; [
      inputs.zen-browser.packages."${system}".default
    ];
  };
}
