{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "joel";
  home.homeDirectory = "/Users/joel";
  home.packages = [
    pkgs.htop
    pkgs.python3
    pkgs.ripgrep
    pkgs.nodejs
    pkgs.emacs
    pkgs.python39Packages.ec2instanceconnectcli
    pkgs.elixir
    pkgs.rustup
  ];
 
 
  programs.git = {
    enable = true;
    userName = "J0";
    userEmail = "lee.yi.jie.joel@gmail.com";
    aliases = {
     st = "status";
    };
  };


  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
