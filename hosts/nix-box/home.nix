# ---------------------------
# Scorpio's Nix-Box HM Config
# ---------------------------

{ ... }:

{
  # ---------------------------
  # Home Manager Options
  # ---------------------------

  home.username = "scorpio";
  home.homeDirectory = "/home/scorpio";
  home.stateVersion = "26.05";

  # ---------------------------
  # Import Module Groups
  # ---------------------------

  imports = [
    ./../../modules/homeManagerModules/default.nix
  ];

  # ---------------------------
  # Module Configuration
  # ---------------------------

  hm-modules = {
    enable = true;
    shells = {
      bash.enable = true;
      nushell.enable = true;
    };
    terminals = {
      alacritty.enable = true;
      wezterm.enable = true;
    };
    tools = {
      eza.enable = true;
      fastfetch.enable = true;
      fuzzel.enable = true;
      fzf.enable = true;
      gpg.enable = true;
      git.enable = true;
      gh.enable = true;
      nix-search-tv.enable = true;
      zoxide.enable = true;
    };
    cli-apps = {
      enable = true;
      lazygit.enable = true;
      neovim.enable = true;
      oh-my-posh.enable = true;
      television.enable = true;
      yazi.enable = true;
    };
    desktop = {
      enable = true;
      quickshell.enable = true;
      swaybg.enable = true;
      swaylock.enable = true;
      waybar.enable = true;
      waypaper.enable = true;
    };
    gui-apps = {
      brave.enable = true;
      equibop.enable = true;
      vscodium.enable = true;
    };
    resources = {
      gruvbox-wallpapers.enable = true;
    };
  };
}