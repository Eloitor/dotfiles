{ pkgs, ... }:
  let unstable = import <nixpkgs-unstable> { };
in {
  home.packages = [ 
    unstable.mathlibtools
    unstable.elan
  ];

  programs.emacs.extraPackages = epkgs: with epkgs; [
    lean-mode ];
}
