{ pkgs, lib, config, niri-dotfiles-repo, create_symlink, ...  }: {

  options = {
    yazi.enable = lib.mkEnableOption "enables yazi";
  };

  config = lib.mkIf config.yazi.enable {

    home.packages = with pkgs; [
      yazi
    ];

    xdg.configFile.yazi = {
      source = create_symlink "${niri-dotfiles-repo}/.config/yazi";
      recursive = true;
    };
    
    programs.yazi = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}