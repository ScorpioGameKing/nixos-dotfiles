{ pkgs, lib, config, ...  }: {
  config = lib.mkIf config.hm-modules.cli-apps.lazygit.enable {
    home.packages = with pkgs; [
      lazygit
    ];
    programs.lazygit = {
      enable = true;
      enableBashIntegration = config.hm-modules.shells.bash.enable;
      enableNushellIntegration = config.hm-modules.shells.nushell.enable;
    };
  };
}