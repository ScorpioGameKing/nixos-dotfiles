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

  # Shells
  bash.enable = false;
  nushell.enable = true;
  
  # Terminals
  alacritty.enable = true;
  wezterm.enable = true;
  
  # Tools
  eza.enable = true;
  fastfetch.enable = true;
  fuzzel.enable = true;
  fzf.enable = true;
  gpg.enable = true;
  git.enable = true;
  gh.enable = true;
  nix-search-tv.enable = true;
  update-nix-fetchgit.enable = false;
  zoxide.enable = true;
  
  # CLI Apps
  cli-apps = {
    enable = true;
  };
  lazygit.enable = true;
  neovim.enable = true;
  oh-my-posh.enable = true;
  television.enable = true;
  yazi.enable = true;
  joshuto.enable = false;
  
  # Desktop Enviroment
  swaybg.enable = true;
  waypaper.enable = true;
  swaylock.enable = true;
  waybar.enable = true;
  quickshell.enable = true;
  mako.enable = true;
  
  # GUI Apps
  brave.enable = true;
  equibop.enable = true;
  vscodium.enable = true;

  # Optional Resources
  gruvbox-wallpapers.enable = true;
}