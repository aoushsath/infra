{ ...}:
{
  programs.git = {
    enable = true;
    userName = "Tosh";
    userEmail = "git@chaoticenginerd.com";
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
      key = "git@chaoticenginerd.com";
      signByDefault = true;
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
