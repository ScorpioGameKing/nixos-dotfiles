{ pkgs, lib, config, ...  }: {
  config = lib.mkIf config.hm-modules.terminals.kitty.enable {
    #home.packages = with pkgs; [
    #  kitty
    #];
    programs.kitty = {
      enable = true;
      font = {
        name = "Agave Nerd Font Mono";
        size = 13;
      };
      shellIntegration = {
        enableBashIntegration = config.hm-modules.shells.bash.enable;
      };
    };
  };
}