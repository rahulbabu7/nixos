# /etc/nixos/modules/git.nix
{ config, pkgs, ... }:

{
  # Git packages
  environment.systemPackages = with pkgs; [
    git
    git-lfs
  ];

  # SSH agent for git
  programs.ssh.startAgent = true;

  # Git configuration
  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "main";
     user = {
       name = "rahulbabu7";
       email = "rahulbabu436@gmail.com";
     };
    };
  };
}
