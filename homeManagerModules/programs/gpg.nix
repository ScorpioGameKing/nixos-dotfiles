{ pkgs, ... }: {
  # ---------------------------
  # Enable gpg and configure gpg
  # for github, lazygit, jujutsu
  # and lazyjj
  # ---------------------------
  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-all;
  };
  # ---------------------------
}
