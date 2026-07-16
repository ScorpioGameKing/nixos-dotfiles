{ pkgs, ... }: {
  # -------------------------
  # Set up the system-wide font
  # Agave is a nice default.
  # -------------------------
  fonts.packages = with pkgs; [
    nerd-fonts.agave
  ];
  # -------------------------
}