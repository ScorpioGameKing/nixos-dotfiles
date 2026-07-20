{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.hm-modules.gui-apps.equibop.enable {
    home.packages = with pkgs; [
      equibop
    ];
  };
}