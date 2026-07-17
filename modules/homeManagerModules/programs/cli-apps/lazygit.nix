{ pkgs, lib, config, ...  }: {

  options = { };

  config = lib.mkIf config.cli-apps.lazygit.enable {
    home.packages = with pkgs; [
      lazygit
    ];
    programs.lazygit = {
      enable = true;
      enableBashIntegration = config.bash.enable;
      enableNushellIntegration = config.nushell.enable;
    };
  };
}