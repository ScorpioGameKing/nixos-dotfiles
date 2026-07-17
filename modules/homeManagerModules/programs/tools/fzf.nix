{ pkgs, lib, config, ... }: {

  options = { };

  config = lib.mkIf config.hm-modules.tools.fzf.enable {
    home.packages = with pkgs; [
      fzf
    ];
    programs.fzf = {
      enable = true;
      enableBashIntegration = config.hm-modules.shells.bash.enable;
    };
  };
}