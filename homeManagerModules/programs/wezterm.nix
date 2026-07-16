{ pkgs, lib, config, ...  }: {

  options = {
    wezterm.enable = lib.mkEnableOption "enables wezterm";
  };

  config = lib.mkIf config.wezterm.enable {
    home.packages = with pkgs; [
      wezterm
    ];
    programs.wezterm = {
      enable = true;
    };
  };
}