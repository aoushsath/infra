{ ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    shellAliases = {
      ls = "ls --color=auto";
      hm = "home-manager";
      path = "echo $PATH | tr . '\n'";
      tree = "tree -C";
    };
    history.size = 5000;
    enableSyntaxHighlighting = true;
    enableAutosuggestions = true;
  };
}
