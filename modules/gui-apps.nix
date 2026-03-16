{ pkgs, ... }:

{
  home.packages = with pkgs; [
    microsoft-edge
    krita
    git
    curl
    uv
    wget
    unzip
  ];
}
