{ pkgs, lib, config, ...  }: {
  config = lib.mkIf config.hm-modules.terminals.kitty.enable {
    programs.kitty = {
      enable = true;
      shellIntegration = {
        enableBashIntegration = config.hm-modules.shells.bash.enable;
      };
    };
  };
}