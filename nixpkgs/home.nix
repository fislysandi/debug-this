{ config, pkgs, libs, ... }:

{
  home.username = "fislysandi";
  home.homeDirectory = "/home/fislysandi";

	 targets.genericLinux.enable = true; # Home Manager needs a bit of information about you and the paths it should manage. home.username = "fislysandi";
	 # This value determines the Home Manager release that your
	  # configuration is compatible with. This helps avoid breakage
	  # when a new Home Manager release introduces backwards
	  # incompatible changes.
	  #
	  # You can update Home Manager without changing this value. See the Home Manager release notes for a list of state version
	  # changes in each release.
	home.stateVersion = "22.11";

	  # Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
	programs.bat.enable = true;

	home.packages = with pkgs ; [
	  keepassxc
	  librewolf
	  dolphin
	  rofi-wayland
	  alacritty
	  htop
	  flameshot
	  neovim
	  nyxt
	  nil
	  gh
	  cinnamon.warpinator
	  ];

	# imports = [ ]; currently none

	  config = {
		allowunfree = true ;
	};
}

 

