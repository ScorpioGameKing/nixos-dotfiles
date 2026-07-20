{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.hm-modules.tools.eza.enable {
    programs.eza = {
      enable = true;
      enableBashIntegration = config.hm-modules.shells.bash.enable;
      enableNushellIntegration = config.hm-modules.shells.nushell.enable;
      icons = "auto";
    };
  };
}