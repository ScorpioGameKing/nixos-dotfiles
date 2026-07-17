{ pkgs, lib, config, ...  }: {

  options = {
    oh-my-posh.enable = lib.mkEnableOption "enables oh-my-posh";
    oh-my-posh.enableBashIntegration = lib.mkEnableOption "enables oh-my-posh bash integration";
  };

  config = lib.mkIf config.oh-my-posh.enable {
    home.packages = with pkgs; [
      oh-my-posh
    ];
    programs.oh-my-posh = {
      enable = true;
      enableBashIntegration = config.oh-my-posh.enableBashIntegration;
      useTheme = "gruvbox";
    };
  };
}