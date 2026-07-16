{ pkgs, ... }: {
  users.users.scorpio= {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };
}