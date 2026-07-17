{ pkgs, lib, config, ...  }: {

  options = { };

  config = lib.mkIf config.tools.git.enable {
    home.packages = with pkgs; [
      git
    ];
    programs.git = {
      enable = true;
      userName = "ScorpioGameKing";
      userEmail = "scorpiogameking@gmail.com";
      signing = {
        key = "8BD9 FC5F 99F9 F198 660A  C5D7 A716 7E06 4502 614C";
        signByDefault = true;
      };
    };
  };
}