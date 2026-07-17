{ pkgs, lib, config, ...  }: {

  options = {
    #yazi.enable = lib.mkEnableOption "enables yazi";
  };

  config = lib.mkIf config.cli-apps.yazi {
    home.packages = with pkgs; [
      yazi
    ];
    programs.yazi = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}