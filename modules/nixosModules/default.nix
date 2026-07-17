{ pkgs, lib, ...}: {
  imports = [
      ./groups/system.nix
      ./groups/users.nix
      ./groups/display-managers.nix
      ./groups/window-managers.nix
      ./groups/gui-apps.nix
      ./groups/desktop.nix
      ./groups/tools.nix
  ];
}