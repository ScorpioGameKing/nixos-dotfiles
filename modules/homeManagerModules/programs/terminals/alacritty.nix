{ pkgs, lib, config, ...  }: {
  config = lib.mkIf config.hm-modules.terminals.alacritty.enable {
    programs.alacritty = {
      enable = true;
    };
  };
}