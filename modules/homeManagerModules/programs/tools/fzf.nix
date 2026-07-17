{ pkgs, lib, config, ... }: {

  options = { };

  config = lib.mkIf config.tools.fzf.enable {
    home.packages = with pkgs; [
      fzf
    ];
    programs.fzf = {
      enable = true;
      enableBashIntegration = config.bash.enable;
    };
  };
}