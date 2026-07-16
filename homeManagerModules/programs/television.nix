{ lib, ... } {
  programs.television = {
    enable = true;
    enableBashIntegration = true;
  };
}
