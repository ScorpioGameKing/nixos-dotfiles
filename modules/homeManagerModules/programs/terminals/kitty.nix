{ pkgs, lib, config, ...  }: {
  config = lib.mkIf config.hm-modules.terminals.kitty.enable {
    home.packages = with pkgs; [
      kitty
    ];
    programs.kitty = {
      enable = true;
    };
  };
}