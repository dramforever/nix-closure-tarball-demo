{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.tarball =
      let pkgs = nixpkgs.legacyPackages.x86_64-linux.pkgsCross.armv7l-hf-multiplatform;
      in pkgs.callPackage ./bashtarball.nix {};
  };
}
