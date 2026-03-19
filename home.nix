{ pkgs, ... }:

let
  swiftToolchain = pkgs.callPackage ./packages/swift-6.1.3-toolchain.nix { };
  hazkey = pkgs.callPackage ./packages/hazkey.nix {
    stdenv = pkgs.gcc14Stdenv;
    inherit swiftToolchain;
  };
in

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

  home.packages = [
    hazkey
  ];

  nixpkgs.config.allowUnfree = true;
}
