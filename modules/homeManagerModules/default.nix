{ pkgs, lib, ...}: {
  imports = [
    ./groups/cli-apps.nix
    ./groups/desktop.nix
    ./groups/gui-apps.nix
    ./groups/resources.nix
    ./groups/shells.nix
    ./groups/terminals.nix
    ./groups/tools.nix
    ./groups/window-managers.nix
  ];
}