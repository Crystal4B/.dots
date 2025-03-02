{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.defaultThemes.enable = lib.mkEnableOption "Enable default theming module";
  };

  config = lib.mkIf config.modules.defaultThemes.enable {
    qt.enable = true;
    qt.platformTheme.name = "gtk";
    qt.style.name = "adwaita-dark";
    qt.style.package = pkgs.adwaita-qt;

    gtk.enable = true;
    gtk.cursorTheme.package = pkgs.bibata-cursors;
    gtk.cursorTheme.name = "Bibata-Modern-Classic";

    gtk.theme.package = pkgs.gnome-themes-extra;
    gtk.theme.name = "Adwaita-dark";

    gtk.iconTheme.package = pkgs.papirus-icon-theme;
    gtk.iconTheme.name = "Papirus Dark";
  };
}
