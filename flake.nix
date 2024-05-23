{
  description = "Build for the SuperVolo variant of ArduPilot";

  inputs = {
    # 20.09 is as far back as nixpkgs can go and support the nix 2.18 flake
    # usage.  SuperVolo latest updates date back to 2019.
    nixpkgs.url = github:nixos/nixpkgs/20.09;
    levers = {
      url = "github:kquick/nix-levers";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # galois-flakes.url = "github:GaloisInc/flakes";
    ardupilot = {
      url = "github:GaloisInc/flake_ardupilot";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.levers.follows = "levers";
      inputs.ardupilot-src.follows = "supervolo-src";
      inputs.ardupilot-patches.follows = "supervolo-patches";
      # gbenchmark
      # ChibiOS
      inputs.googletest-src.follows = "googletest-src";
      inputs.libcanard-src.follows = "libcanard-src";
      inputs.mavlink-src.follows = "mavlink-src";
      inputs.pymavlink-src.follows = "pymavlink-src";
      inputs.waf-src.follows = "waf-src";
      inputs.CANBUS.follows = "CANBUS";
    };
    supervolo-src = {
      url = "github:RMIShane/ardupilot/SuperVolo_Master";
      flake = false;
    };
    supervolo-patches = {
      url = "./patches";
      flake = false;
    };
    googletest-src = {
      url = "github:ArduPilot/googletest/10b1902";
      flake = false;
    };
    libcanard-src = {
      url = "github:DroneCAN/libcanard/99163fc";
      flake = false;
    };
    mavlink-src = {
      url = "github:ArduPilot/mavlink/6aeff35";
      flake = false;
    };
    pymavlink-src = {
      url = "github:ArduPilot/pymavlink/ef30682";
      flake = false;
    };
    waf-src = {
      url = "github:ArduPilot/waf/67b3eac";
      flake = false;
    };
    CANBUS = {
      url = "github:GaloisInc/flakes?dir=uavcan";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.levers.follows = "levers";
      inputs.uavcan-src.follows = "uavcan-src";
      inputs.uavcan_DSDL-src.follows = "uavcan_DSDL-src";
      inputs.pyuavcan-src.follows = "pyuavcan-src";
    };
    uavcan-src = {
      url = "github:Ardupilot/uavcan/3ef4b88";
      flake = false;
    };
    uavcan_DSDL-src = {
      url = "github:UAVCAN/dsdl/192295c";
      flake = false;
    };
    pyuavcan-src = {
      url = "github:UAVCAN/pyuavcan/c58477a";
      flake = false;
    };
  };

  outputs = {
    self, nixpkgs, levers
    , ardupilot
    , supervolo-src
    , supervolo-patches
    , ...
  }: {
    apps = ardupilot.apps;
    packages = ardupilot.packages;
  };
}
