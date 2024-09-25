{ ... }:

{
  programs.git = {
    enable = true;
    userName = "Morgan Hand";
    userEmail = "night.dragonjr@outlook.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
      pull.rebase = false;
    };
  };
}
