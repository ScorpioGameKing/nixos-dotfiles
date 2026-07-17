{ pkgs, lib, config, ... }: {
  
  options = { };

  config = lib.mkIf config.tools.eza.enable {
    home.packages = with pkgs; [
      eza
    ];
    programs.eza = {
      enable = true;
      enableBashIntegration = config.shells.bash.enable;
      enableNushellIntegration = config.shells.nushell.enable;
      icons = "auto";
    };
  };
}