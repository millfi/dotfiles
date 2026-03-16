{ ... }:

{
  imports = [
    ./modules/gui-apps.nix
    ./modules/comfyui.nix
    ./modules/plasma-layout.nix
  ];

  home.username = "millfi";
  home.homeDirectory = "/home/millfi";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
  programs.bash.enable = true;

  fonts.fontconfig.enable = true;

  nixpkgs.config.allowUnfree = true;
}
