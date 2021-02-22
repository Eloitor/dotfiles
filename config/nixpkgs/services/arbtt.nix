{ pkgs, ... }:

  let unstable = import <nixpkgs-unstable> { };               # Droidcam Lean Obsidian
  in 
{
  home.packages = [ unstable.pkgs.haskellPackages.arbtt ];

  systemd.user.services.arbtt = {
    Unit.Description = "arbtt time tracker";
    Service = {
      Type = "simple";
      ExecStart = "${unstable.pkgs.haskellPackages.arbtt}/bin/arbtt-capture";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
      

}
