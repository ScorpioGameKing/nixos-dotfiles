{ pkgs, lib, config, ...  }: {
  config = lib.mkIf config.hm-modules.terminals.kitty.enable {
    #home.packages = with pkgs; [
    #  kitty
    #u];
    programs.kitty = {
      enable = true;
      shellIntegration = {
        enableBashIntegration = config.hm-modules.shells.bash.enable;
      };
    };
  };
}