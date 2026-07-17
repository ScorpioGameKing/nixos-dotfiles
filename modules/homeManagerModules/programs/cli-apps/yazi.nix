{ pkgs, lib, config, inputs, ...  }: 

let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) niri-dotfiles-repo;
in

{

  options = {
    yazi.enable = lib.mkEnableOption "enables yazi";
    yazi.enableBashIntegration = lib.mkEnableOption "enables yazi bash integration";
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
      enableBashIntegration = config.yazi.enableBashIntegration;
    };
  };
}