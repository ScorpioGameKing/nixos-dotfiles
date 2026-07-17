{ pkgs, lib, config, ...  }: {

  options = {
    nix-search-tv.enable = lib.mkEnableOption "enables nix-search-tv";
  };

  config = lib.mkIf config.nix-search-tv.enable {
    home.packages = with pkgs; [
      nix-search-tv
    ];
    programs.nix-search-tv = {
      enable = true;
      enableTelevisionIntegration = config.cli-apps.television.enable;
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
