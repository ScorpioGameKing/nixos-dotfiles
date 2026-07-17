{ pkgs, lib, config, ... }: {

  options = {
    fzf.enable = lib.mkEnableOption "enables fzf";
  };

  config = lib.mkIf config.fzf.enable {
    home.packages = with pkgs; [
      fzf
    ];
    programs.fzf = {
      enable = true;
      enableBashIntegration = config.bash.enable;
    };
  };
}