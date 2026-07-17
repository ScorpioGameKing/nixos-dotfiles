{ pkgs, lib, config, ... }: {
  
  options = { };

  config = lib.mkIf config.cli-apps.television.enable {
    home.packages = with pkgs; [
      television
    ];
    programs.television = {
      enable = true;
      enableBashIntegration = config.bash.enable;
      enableNushellIntegration = config.nushell.enable;
    };
  };
}
