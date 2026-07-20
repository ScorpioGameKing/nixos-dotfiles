{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.hm-modules.cli-apps.television.enable {
    home.packages = with pkgs; [
      television
    ];
    programs.television = {
      enable = true;
      enableBashIntegration = config.hm-modules.shells.bash.enable;
      enableNushellIntegration = config.hm-modules.shells.nushell.enable;
    };
  };
}
