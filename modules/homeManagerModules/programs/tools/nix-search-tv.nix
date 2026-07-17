{ pkgs, lib, config, ...  }: {

  options = { };

  config = lib.mkIf config.tools.nix-search-tv.enable {
    home.packages = with pkgs; [
      nix-search-tv
    ];
    programs.nix-search-tv = {
      enable = true;
      enableTelevisionIntegration = config.hm-modules.cli-apps.television.enable;
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
