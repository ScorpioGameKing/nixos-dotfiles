{ pkgs, lib, config, ...  }: {
  config = lib.mkIf config.hm-modules.terminals.alacritty.enable {
    home.packages = with pkgs; [
      alacritty
    ];
    programs.alacritty = {
      enable = true;
    };
  };
}