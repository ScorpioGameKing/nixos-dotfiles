{ pkgs, lib, config, ...  }: {

  options = {
    gpg.enable = lib.mkEnableOption "enables gpg";
  };

  config = lib.mkIf config.gpg.enable {
    programs.gpg.enable = true;
    services.gpg-agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-all;
    };
  };
}
