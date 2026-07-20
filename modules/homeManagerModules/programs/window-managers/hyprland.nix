{ lib, config, inputs, ... }: {
  config = lib.mkIf config.hm-modules.window-managers.hyprland-configs.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      package = null;
      portalPackage = null;
    };
  };
}