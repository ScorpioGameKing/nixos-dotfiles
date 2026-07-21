{ pkgs, lib, config, inputs, ...  }: 
let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) nixos-dotfiles-repo; 
in
{
  config = lib.mkIf config.hm-modules.cli-apps.yazi.enable {
    if config.hm-modules.useLocalRepo
    then xdg.configFile.yazi = {
      source = create_symlink "${config.hm-modules.localRepoPath}/.config/yazi/";
      recursive = true;
    };
    else xdg.configFile.yazi = {
      source = create_symlink "${nixos-dotfiles-repo}/.config/yazi/";
      recursive = true;
    };
    #xdg.configFile.yazi = {
    #  source = create_symlink "${repo_path}/.config/yazi/";
    #  recursive = true;
    #}; 
    programs.yazi = {
      enable = true;
      enableBashIntegration = config.hm-modules.shells.bash.enable;
      enableNushellIntegration = config.hm-modules.shells.nushell.enable;
    };
  };
}