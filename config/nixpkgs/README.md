# How I use home-manager
  
  - I use the nix unstable channel. First run
  ```bash
  nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs-unstable
  ```
  And then add
  ``` nix
  let unstable = import <nixpkgs-unstable> { };
  ```
  at the top of your ~/.config/nixpkgs/home.nix

