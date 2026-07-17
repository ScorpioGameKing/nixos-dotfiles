{ pkgs, lib, config, ... }: {
  
  options = { };

  config = lib.mkIf config.cli-apps.television.enable {
    home.packages = with pkgs; [
      television
    ];
    programs.television = {
      enable = true;
      enableBashIntegration = config.shells.bash.enable;
      enableNushellIntegration = config.shells.nushell.enable;
    };
  };
}
