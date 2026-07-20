{ pkgs, lib, config, ... }: {
 config = lib.mkIf config.nixos-modules.desktop.nb-stylix.enable {
    stylix = {
      enable = true;
      base16Scheme = config.nixos-modules.desktop.nb-stylix.base16Scheme;
      autoEnable = config.nixos-modules.desktop.nb-stylix.autoEnable;
    };
  };
}