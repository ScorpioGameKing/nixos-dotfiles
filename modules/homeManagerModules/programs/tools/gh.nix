{ pkgs, lib, config, ...  }: {

  options = { };

  config = lib.mkIf config.hm-modules.tools.gh.enable {
    home.packages = with pkgs; [
      gh
    ];
    programs.gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };
  };
}