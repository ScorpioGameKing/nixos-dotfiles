{ pkgs, lib, config, ...  }: {

  options = {
    gh.enable = lib.mkEnableOption "enables gh";
  };

  config = lib.mkIf config.gh.enable {
    home.packages = with pkgs; [
      gh
    ];
    programs.gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };
  };
}