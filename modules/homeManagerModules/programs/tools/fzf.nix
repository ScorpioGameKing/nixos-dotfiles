{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.hm-modules.tools.fzf.enable {
    programs.fzf = {
      enable = true;
      enableBashIntegration = config.hm-modules.shells.bash.enable;
    };
  };
}