{ pkgs, lib, config, ... }: {

  options = { };

  config = lib.mkIf config.nixos-modules.desktop.nb-stylix.enable {
    stylix = {
      enable = true;
      base16Scheme = lib.mkIf config.nixos-modules.desktop.nb-stylix.base16Scheme;
      autoEnable = lib.mkIf config.nixos-modules.desktop.nb-stylix.autoEnable;
    };
  };
}