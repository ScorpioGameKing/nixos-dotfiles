{ pkgs, lib, config, ... }: {

  options = {
    fzf.enable = lib.mkEnableOption "enables fzf";
    fzf.enableBashIntegration = lib.mkEnableOption "enables fzf bash integration";
  };

  config = lib.mkIf config.fzf.enable {
    home.packages = with pkgs; [
      fzf
    ];
    programs.fzf = {
      enable = true;
      enableBashIntegration = config.fzf.enableBashIntegration;
    };
  };
}