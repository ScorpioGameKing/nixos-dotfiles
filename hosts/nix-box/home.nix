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
  shells = {
    bash.enable = true;
    nushell.enable = true;
  };
  
  # Terminals
  terminals = {
    alacritty.enable = true;
    wezterm.enable = true;
  };
  
  # Tools
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
  
  # CLI Apps
  cli-apps = {
    enable = true;
    lazygit.enable = true;
    neovim.enable = true;
    oh-my-posh.enable = true;
    television.enable = true;
    yazi.enable = true;
  };
  
  # Desktop Enviroment
  desktop = {
    enable = true;
    quickshell.enable = true;
    swaybg.enable = true;
    swaylock.enable = true;
    waybar.enable = true;
    waypaper.enable = true;
  };
  
  # GUI Apps
  gui-apps = {
    brave.enable = true;
    equibop.enable = true;
    vscodium.enable = true;
  };

  # Optional Resources
  resources = {
    gruvbox-wallpapers.enable = true;
  };
}