{ pkgs, lib, config, ...  }: {
  config = lib.mkIf config.hm-modules.cli-apps.oh-my-posh.enable {
    home.packages = with pkgs; [
      oh-my-posh
    ];
    programs.oh-my-posh = {
      enable = true;
      enableBashIntegration = config.hm-modules.shells.bash.enable;
      enableNushellIntegration = config.hm-modules.shells.nushell.enable;
      useTheme = "gruvbox";
    };
  };
}