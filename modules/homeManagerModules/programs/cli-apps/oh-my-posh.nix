{ pkgs, lib, config, ...  }: {

  options = { };

  config = lib.mkIf config.cli-apps.oh-my-posh.enable {
    home.packages = with pkgs; [
      oh-my-posh
    ];
    programs.oh-my-posh = {
      enable = true;
      enableBashIntegration = config.bash.enable;
      enableNushellIntegration = config.nushell.enable;
      useTheme = "gruvbox";
    };
  };
}