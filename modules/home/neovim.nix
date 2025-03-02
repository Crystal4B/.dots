{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.neovim.enable = lib.mkEnableOption "Enable Neovim module";
  };

  config = lib.mkIf config.modules.neovim.enable {
    programs.neovim = {
      enable = true;
      withNodeJs = true;
    };

    home.packages = with pkgs; [
      ripgrep
      fzf
      fd
      gcc
      gnumake
      lua
      python314
      unzip
      wget
      tree-sitter

      # LSPs
      lua-language-server
      stylua
      nixd
      nixfmt-rfc-style
      gopls
      go
      delve
    ];

    home.file.".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/dotfiles/common/nvim";
    };
  };
}
