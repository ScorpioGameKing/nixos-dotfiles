{ pkgs, lib, config, ... }: {
  
  options = {
    eza.enable = lib.mkEnableOption "enables eza";
  };

  config = lib.mkIf config.eza.enable {
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