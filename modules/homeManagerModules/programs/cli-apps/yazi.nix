{ pkgs, lib, config, inputs, ...  }: 
let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) nixos-dotfiles-repo;
  if config.hm-modules.useLocalRepo
  then repo_path = "${config.hm-modules.localRepoPath}"
  else repo_path = "${nixos-dotfiles-repo}"; 
in
{
  config = lib.mkIf config.hm-modules.cli-apps.yazi.enable {
    xdg.configFile.yazi = {
      source = create_symlink "${repo_path}/.config/yazi/";
      recursive = true;
    }; 
    programs.yazi = {
      enable = true;
      enableBashIntegration = config.hm-modules.shells.bash.enable;
      enableNushellIntegration = config.hm-modules.shells.nushell.enable;
    };
  };
}