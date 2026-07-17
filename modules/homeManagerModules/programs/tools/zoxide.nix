{ pkgs, lib, config, ...  }: {

  options = {
    zoxide.enable = lib.mkEnableOption "enables zoxide";
    zoxide.enableBashIntegration = lib.mkEnableOption "enables zoxide bash integration";
  };

  config = lib.mkIf config.zoxide.enable {
    home.packages = with pkgs; [
      zoxide
    ];
    programs.zoxide = {
      enable = true;
      enableBashIntegration = config.zoxide.enableBashIntegration;
      options = [
        "--cmd cd"
      ];
    };
  };
}