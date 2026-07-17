{ pkgs, lib, config, ... }: {

  options = {
    nb-stylix.enable = lib.mkEnableOption "enables stylix";
  };

  config = lib.mkIf config.nb-stylix.enable {
    stylix = {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
      autoEnable = true;
    };
  };
}