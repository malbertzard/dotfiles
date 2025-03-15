{ pkgs, ... }:
{
  programs.git = {
    enable = true;
	userEmail = "malbertzard@gmail.com";
    userName = "Mathis Albertzard";

    aliases = {
      l = "log --pretty=format:'%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --decorate --date=short";
      lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
	  
      last = "log -1 HEAD --stat";
      st = "status -sb";
	  
      daily = "log --since '1 day ago' --oneline --author '$(git config user.email)'";
      daily-all = "log --since '1 day ago' --oneline";

      weekly = "log --since '7 day ago' --oneline --author '$(git config user.email)'";
      weekly-all = "log --since '7 day ago' --oneline";
	  
      branch-log = "!git log --oneline --decorate --graph --first-parent --topo-order --no-merges $1..HEAD";
      branch-full-log = "!git log --oneline --decorate --graph --first-parent --topo-order $1..HEAD";
      cl = "checkout -";
      co = "checkout";
      cob = "checkout -b";

      a = "add";
      ap = "add -p";

      c = "commit --verbose";
      ca = "commit -a --verbose";
      cm = "commit -m";
      cam = "commit -a -m";
      cAe = "commit --amend --no-edit";
      cA = "commit --amend --verbose";

      fpush = "push --force-with-lease";

      d = "diff";
      dS = "diff -C -C -C";
      ds = "diff --stat";
      dc = "diff --cached";
	
      b = "!git for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/heads | sed -e 's-refs/heads/--'";

      la = "!git config -l | grep alias | cut -c 7-";
    };
  };
}
