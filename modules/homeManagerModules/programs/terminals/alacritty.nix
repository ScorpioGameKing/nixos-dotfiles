{ pkgs, lib, config, ...  }: {

  options = { };

  config = lib.mkIf config.terminals.alacritty.enable {
    home.packages = with pkgs; [
      alacritty
    ];
    programs.alacritty = {
      enable = true;
    };
  };
}