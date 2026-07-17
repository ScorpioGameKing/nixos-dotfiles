{ pkgs, lib, config, ...  }: {

  options = {
    nix-search-tv.enable = lib.mkEnableOption "enables nix-search-tv";
    nix-search-tv.enableTelevisionIntegration = lib.mkEnableOption "enables nix-search-tv television integration";
  };

  config = lib.mkIf config.nix-search-tv.enable {
    home.packages = with pkgs; [
      nix-search-tv
    ];
    programs.nix-search-tv = {
      enable = true;
      enableTelevisionIntegration = config.nix-search-tv.enableTelevisionIntegration;
      settings = {
        indexes = [
          "nixpkgs"
          "home-manager"
          "nixos"
        ];
      };
    };
  };
}
