{ pkgs, lib, config, ...  }: {

  options = { };

  config = lib.mkIf config.tools.zoxide.enable {
    home.packages = with pkgs; [
      zoxide
    ];
    programs.zoxide = {
      enable = true;
      enableBashIntegration = config.shells.bash.enable;
      enableNushellIntegration = config.shells.nushell.enable;
      options = [
        "--cmd cd"
      ];
    };
  };
}