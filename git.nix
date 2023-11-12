{ ...}:
{
  programs.git = {
    enable = true;
    userName = "Aashutosh";
    userEmail = "119551649+ashtuohsa@users.noreply.github.com";
    aliases = {
      a = "add";
      c = "commit";
      l = "log --oneline --graph";
      p = "push";
      s = "status";
      df = "diff";
      sdf = "diff --staged";
    };
    signing = {
      key = "119551649+ashtuohsa@users.noreply.github.com";
      signByDefault = true;
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
