{ pkgs, lib, config, ...  }: {

  options = { };

  config = lib.mkIf config.hm-modules.cli-apps.oh-my-posh.enable {
    home.packages = with pkgs; [
      oh-my-posh
    ];
    programs.oh-my-posh = {
      enable = true;
      enableBashIntegration = config.shells.bash.enable;
      enableNushellIntegration = config.shells.nushell.enable;
      useTheme = "gruvbox";
    };
  };
}