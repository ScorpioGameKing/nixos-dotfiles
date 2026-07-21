{ pkgs, lib, config, inputs, ...  }: 
{
  config = lib.mkIf config.hm-modules.cli-apps.joshuto.enable {
    programs.joshuto = {
      enable = true;
      settings = {
        display = {
          show_hidden = true;
          line_number_style = "relative";
        };
      };
    };
  };
}