{ pkgs, lib, config, ... }: {
  
  options = { };

  config = lib.mkIf config.tools.eza.enable {
    home.packages = with pkgs; [
      eza
    ];
    programs.eza = {
      enable = true;
      enableBashIntegration = config.bash.enable;
      enableNushellIntegration = config.nushell.enable;
      icons = "auto";
    };
  };
}