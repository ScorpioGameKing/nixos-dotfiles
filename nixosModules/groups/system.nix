{ ... }: {
  imports = [
    ./../system/boot.nix
    ./../system/hardware.nix
    ./../system/networking.nix
    ./../system/security.nix
    ./../system/services.nix
    ./../system/time.nix
  ];
}