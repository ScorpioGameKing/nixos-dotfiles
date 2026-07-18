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
    enable = false;

    cli-apps = {
      enable = false;

      joshuto = false;
      lazygit.enable = false;
      neovim.enable = false;
      oh-my-posh.enable = false;
      television.enable = false;
      yazi.enable = false;
    };
    
    desktop = {
      enable = false;

      mako = false;
      quickshell.enable = false;
      swaybg.enable = false;
      swaylock.enable = false;
      waybar.enable = false;
      waypaper.enable = false;
    };
    
    gui-apps = {
      enable = false;

      brave.enable = false;
      equibop.enable = false;
      vscodium.enable = false;
    };
    
    resources = {
      enable = false;

      gruvbox-wallpapers.enable = false;
    };
    
    shells = {
      enable = false;

      bash.enable = false;
      nushell.enable = false;
    };
    
    terminals = {
      enable = false;

      wezterm.enable = false;
      alacritty.enable = false;
    };
    
    tools = {
      enable = false;

      eza.enable = false;
      fastfetch.enable = false;
      fuzzel.enable = false;
      fzf.enable = false;
      gh.enable = false;
      git.enable = false;
      gpg.enable = false;
      nix-search-tv.enable = false;
      update-nix-fetchgit = false;
      zoxide.enable = false;
    };
    
    window-managers = {
      enable = false;

      niri-configs.enable = false;
    }
  };
}