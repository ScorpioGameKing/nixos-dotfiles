{ pkgs, lib, config, ...  }: {

  options = { };

  config = lib.mkIf config.tools.zoxide.enable {
    home.packages = with pkgs; [
      zoxide
    ];
    programs.zoxide = {
      enable = true;
      enableBashIntegration = config.bash.enable;
      enableNushellIntegration = config.nushell.enable;
      options = [
        "--cmd cd"
      ];
    };
  };
}