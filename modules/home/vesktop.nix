{ pkgs, config, lib, ... }:
{
    options = {
        modules.vesktop.enable = lib.mkEnableOption "Enable vesktop module";
    };

    config = lib.mkIf config.modules.vesktop.enable {
        home.packages = with pkgs; [
            vesktop
        ];
    };
}

