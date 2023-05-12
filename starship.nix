{ ...}:
{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$directory$git_status$character ";
      directory = {
        read_only = " [RO]";
        truncation_length = 1;
      };
      character = {
        error_symbol = "\\$";
        success_symbol = "\\$";
      };
      git_branch = {
        format = "\\([$branch(:$remote_branch)]($style)\\ )";
        style = "purple";
      };
      git_status = {
        format = "(\\[[$all_status$ahead_behind]($style)\\] )";
        ahead = ">";
        behind = "<";
        deleted = "x";
        diverged = "<>";
        renamed = "r";
        style = "red";
      };
      python = {
        format = "(\\($virtualenv\\)) ";
      };
    };
  };
}
