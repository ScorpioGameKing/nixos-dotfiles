{ pkgs, lib, config, ...  }: {

  options = {
    oh-my-posh.enable = lib.mkEnableOption "enables oh-my-posh";
  };

  config = lib.mkIf config.oh-my-posh.enable {
    home.packages = with pkgs; [
      oh-my-posh
    ];
    programs.oh-my-posh = {
      enable = true;
      enableBashIntegration = true;
      useTheme = "gruvbox";
    };
  };
}