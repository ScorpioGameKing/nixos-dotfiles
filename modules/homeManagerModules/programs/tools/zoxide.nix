{ pkgs, lib, config, ...  }: {
  config = lib.mkIf config.hm-modules.tools.zoxide.enable {
    programs.zoxide = {
      enable = true;
      enableBashIntegration = config.hm-modules.shells.bash.enable;
      enableNushellIntegration = config.hm-modules.shells.nushell.enable;
      options = [
        "--cmd cd"
      ];
    };
  };
}