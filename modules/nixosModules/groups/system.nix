{ ... }: {
  imports = [
    ./../system/boot.nix
    ./../system/hardware.nix
    ./../system/networking.nix
    ./../system/nix-settings.nix
    ./../system/security.nix
    ./../system/services.nix
    ./../system/time.nix
    ./../system/font.nix
  ];
}