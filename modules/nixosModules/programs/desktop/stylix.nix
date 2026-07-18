{ pkgs, lib, config, ... }: {

  options = { };

  config = lib.mkIf config.nixos-modules.desktop.nb-stylix.enable {
    stylix = {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
      autoEnable = true;
    };
  };
}