{ bash
, runCommandNoCC, closureInfo
}:

runCommandNoCC "tarball.tar.xz" {
  closure = closureInfo {
    rootPaths = [ bash ];
  };
  __structuredAttrs = true;
  unsafeDiscardReferences.out = true;
} ''
  tar --owner=0 --group=0 --numeric-owner -cJvf "$out" -T "$closure/store-paths"
''
