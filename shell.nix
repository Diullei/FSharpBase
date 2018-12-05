with import <nixpkgs> {};
let 
  ps1812 = import (fetchFromGitHub {
                   owner="NixOS";
                   repo="nixpkgs";
                   rev="f4c0220";
                   sha256="1h43sgg8kj4r28j4s181sfb00d5fxwgnfq27jf5dz4sng5iwhyyw";
  }) {};


  dotnet = ps1812.callPackage ( import ./dotnet.nix ) {};

  vscode = 
    #buildVSCode can be found in https://gi`hub.com/countoren/nixpkgs/blob/master/config.nix
    buildVSCode {
      settingsFile = ./vscode/settings.nix;
      vscodeMatketExtensions = [
          {
            name = "vim";
            publisher = "vscodevim";
            version = "0.16.13";
            sha256 = "02bfld819nrsik17zyzckbv8vfz28hdlnkx4id7kx54f41y5kx0v";
          }
          # FSharp
          {
            name = "ionide-fsharp";
            publisher = "ionide";
            version = "3.30.0";
            sha256 = "0ig9zmbyfmxvjfjnn1f108vpij9q3qzh74b3gwr12kziiy3qmiyi";
          }
          {
            name = "ionide-paket";
            publisher = "ionide";
            version = "1.12.0";
            sha256 = "10ik4jhvh05363swdfnr7phlnsndypaq3bkrl612z2kvv38q5kl7";
          }
          {
            name = "ionide-fake";
            publisher = "ionide";
            version = "1.2.3";
            sha256 = "0ijgnxcdmb1ij3szcjlyxs2lb1kly5l26lg9z2fa7hfn67rrds29";
          }

        ];
      };
in
stdenv.mkDerivation rec {
  name = "fsTest";
  buildInputs = [
    figlet
    dotnet
    ps1812.git
    ps1812.mono
    ps1812.fsharp
    ps1812.dotnetPackages.Fake
    ps1812.dotnetPackages.Paket
  ] 
  ++ vscode.buildInputs;
  shellHook = ''
    figlet "wellcome to FS test"
  ''
  + vscode.shellHook;
}
