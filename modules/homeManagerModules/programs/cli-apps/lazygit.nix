{ pkgs, lib, config, ...  }: {

  options = { };

  config = lib.mkIf config.cli-apps.lazygit.enable {
    home.packages = with pkgs; [
      lazygit
    ];
    programs.lazygit = {
      enable = true;
      enableBashIntegration = config.shells.bash.enable;
      enableNushellIntegration = config.shells.nushell.enable;
    };
  };
}