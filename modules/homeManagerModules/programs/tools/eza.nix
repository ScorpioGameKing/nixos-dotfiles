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
      enableBashIntegration = lib.mkIf config.bash.enable;
      icons = "auto";
    };
  };
}