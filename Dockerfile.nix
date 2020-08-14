{ sources ? import ./nix/sources.nix }:
let
  pkgs = import sources.nixpkgs {};
  contents = import ./default.nix { inherit sources; };
in
  pkgs.dockerTools.buildImage {
    name = "build-next-with-nix";
    tag = "latest";
    inherit contents;
    config = {
      Env = [ "NODE_ENV=production" ];
      Cmd = [ "/bin/npm" "run" "start" "--scripts-prepend-node-path" ];
    };
  }
    
