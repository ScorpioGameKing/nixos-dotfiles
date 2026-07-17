{ pkgs, lib, config, ...  }: {

  options = { };

  config = lib.mkIf config.hm-modules.tools.gpg.enable {
    programs.gpg.enable = true;
    services.gpg-agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-all;
    };
  };
}
