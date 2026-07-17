{ ... }: {
  networking.hostName = "nix-box"; 
  networking.networkmanager.enable = true;
}