{ pkgs, config, ... }:
{
    imports = [
        ../../modules/home
    ];

    modules.neovim.enable = true;

    home.username = "msek";
    home.homeDirectory = "/home/msek";
    home.sessionVariables = {
        LANG = "pl_PL.UTF-8";
        LC_ALL = "pl_PL.UTF-8";
    };

    home.keyboard = {
        layout = "pl";
        variant = "programmers";
    };

    programs.home-manager.enable = true;

    home.stateVersion = "24.05";
}

