{ pkgs, lib, config, ... }: {
  options = {
    eza.enable = lib.mkEnableOption "enables eza";
  };
  config = lib.mkIf config.eza.enable {
    enviroment.systemPackages = with pkgs; [
      eza
    ];
    programs.eza = {
      enable = true;
      enableBashIntegration = true;
      icons = "auto";
    };
  };
}