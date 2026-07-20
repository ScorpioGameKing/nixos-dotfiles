{ pkgs, lib, config, ...  }: {
  config = lib.mkIf config.hm-modules.tools.gh.enable {
    programs.gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };
  };
}