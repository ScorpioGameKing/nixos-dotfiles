{ ... }: {
  imports = [
    ./../programs/desktop/brightnessctl.nix
    ./../programs/desktop/stylix.nix
    ./../programs/desktop/xwayland-satellite.nix
  ];
}