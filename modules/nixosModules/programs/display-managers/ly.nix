{ lib, config, ... }: {
  config = lib.mkIf config.nixos-modules.display-managers.ly.enable {
    services.displayManager.ly = {
      enable = true;
      settings = {
        animation = config.nixos-modules.display-managers.ly.settings.animation;
        box_title = config.nixos-modules.display-managers.ly.settings.box_title;
        clock = config.nixos-modules.display-managers.ly.settings.clock;
        cmatrix_min_codepoint = config.nixos-modules.display-managers.ly.settings.cmatrix_min_codepoint;
        cmatrix_max_codepoint = config.nixos-modules.display-managers.ly.settings.cmatrix_max_codepoint;
        colormix_col1 = config.nixos-modules.display-managers.ly.settings.colormix_col1;
        colormix_col2 = config.nixos-modules.display-managers.ly.settings.colormix_col2;
        colormix_col3 = config.nixos-modules.display-managers.ly.settings.colormix_col3;
        corner_top_left = config.nixos-modules.display-managers.ly.settings.corner_top_left;
        corner_top_right = config.nixos-modules.display-managers.ly.settings.corner_top_right;
      };
    };
  };
}
