{ lib, config, inputs, ... }: {
  config = lib.mkIf config.nixos-modules.window-managers.hyprland.enable {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };
}