{ pkgs, lib, config, inputs, ...  }: 
let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) nixos-dotfiles-repo;
in
{
  config = lib.mkIf config.hm-modules.cli-apps.yazi.enable {
    home.packages = with pkgs; [
      yazi
    ];
    xdg.configFile.yazi = {
      source = create_symlink "${nixos-dotfiles-repo}/.config/yazi/";
      recursive = true;
    }; 
    programs.yazi = {
      enable = true;
      enableBashIntegration = config.hm-modules.shells.bash.enable;
      enableNushellIntegration = config.hm-modules.shells.nushell.enable;
    };
  };
}