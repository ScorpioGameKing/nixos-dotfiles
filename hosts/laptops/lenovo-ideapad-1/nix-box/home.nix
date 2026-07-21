# ---------------------------
# Scorpio's Nix-Box HM Config
# ---------------------------

{ inputs, ... }:

{

  # ---------------------------
  # We Dont't Touch stateVersion
  # ---------------------------
  home.stateVersion = "26.05";
  # ---------------------------

  # ---------------------------
  # Import Module Groups
  # ---------------------------

  imports = [
    inputs.nvf.homeManagerModules.default
    ./../../../../modules/homeManagerModules/default.nix
  ];

  # ---------------------------
  # Module Configuration
  # ---------------------------

  hm-modules = {
    enable = true;
    cli-apps = {
      enable = true;
      lazygit.enable = true;
      neovim.enable = true;
      oh-my-posh.enable = true;
      television.enable = true;
      yazi.enable = true;
      joshuto.enable = true;
    };
    desktop = {
      enable = true;
      mako.enable = true;
      quickshell.enable = true;
      swaybg.enable = true;
      swaylock.enable = true;
      waybar.enable = true;
      waypaper.enable = true;
    };
    gui-apps = {
      enable = true;
      brave.enable = true;
      equibop.enable = true;
      vscodium.enable = true;
    };
    resources = {
      enable = true;
      gruvbox-wallpapers.enable = true;
    };
    shells = {
      enable = true;
      bash.enable = true;
    };
    system = {
      enable = true;
      hm-settings = {
        enable = true;
        username = "scorpio";
        homeDirectory = "/home/scorpio";
      };
      udiskie = {
        enable = true;
        settings = {
          automount = true;
          notify = true;
        };
      };
      udisks2.enable = true;
    };
    terminals = {
      enable = true;
      alacritty.enable = true;
      kitty.enable = true;
      wezterm.enable = true;
    };
    tools = {
      enable = true;
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
  };
}
