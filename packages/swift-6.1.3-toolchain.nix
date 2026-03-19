{ lib
, stdenvNoCC
, fetchzip
, fetchurl
, autoPatchelfHook
, makeWrapper
, curl
, libedit
, libxml2
, ncurses
, openssl
, sqlite
, stdenv
, util-linux
, xz
, zlib
, zstd
}:

let
  gccToolchain = stdenv.cc.cc;
  gccLibDir = "${gccToolchain}/lib/gcc/${stdenv.hostPlatform.config}/${gccToolchain.version}";
  glibc = lib.getLib stdenv.cc.libc;
  glibcDev = stdenv.cc.libc.dev;
  ubuntuLibcDev = fetchurl {
    url = "https://archive.ubuntu.com/ubuntu/pool/main/g/glibc/libc6-dev_2.39-0ubuntu8_amd64.deb";
    hash = "sha256-HwO3kiPZzxpu06ZI9pQmGdy5eyiE26j9EuJitnceJHo=";
  };

  libeditLib = lib.getLib libedit;
  libxml2Lib = lib.getLib libxml2;

  compatLibs = stdenvNoCC.mkDerivation {
    pname = "swift-toolchain-compat-libs";
    version = "6.1.3";

    dontUnpack = true;

    installPhase = ''
      mkdir -p $out/lib
      ln -s ${libxml2Lib}/lib/libxml2.so.16 $out/lib/libxml2.so.2
    '';
  };

  runtimeLibs = [
    curl
    libeditLib
    libxml2Lib
    ncurses
    openssl
    sqlite
    stdenv.cc.cc.lib
    util-linux
    xz
    zlib
    zstd
    compatLibs
  ];

  runtimeLibraryPath = lib.makeLibraryPath runtimeLibs;
  compilerLibraryPath = lib.concatStringsSep ":" [
    "${glibc}/lib"
    gccLibDir
    "${stdenv.cc.cc.lib}/lib"
  ];
  toolPath = lib.concatStringsSep ":" [
    "$out/bin"
    "${stdenv.cc}/bin"
    "${stdenv.cc.bintools}/bin"
    "$out/usr/bin"
  ];
in
stdenvNoCC.mkDerivation rec {
  pname = "swift-toolchain-bin";
  version = "6.1.3";

  src = fetchzip {
    url = "https://download.swift.org/swift-6.1.3-release/ubuntu2404/swift-6.1.3-RELEASE/swift-6.1.3-RELEASE-ubuntu24.04.tar.gz";
    hash = "sha256-PMSd42a4sAV73evWwIDYkn7NaYmNfA+e8lsLrvWSe8g=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
  ];

  buildInputs = runtimeLibs;

  autoPatchelfIgnoreMissingDeps = [
    "libpython3*.so*"
  ];

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -R usr $out/
    chmod -R u+w $out

    mkdir -p $out/nix-sdk/usr/lib
    ln -s $out/usr/lib/swift $out/nix-sdk/usr/lib/swift

    ubuntuLibcTmp="$TMPDIR/ubuntu-libc6-dev"
    mkdir -p "$ubuntuLibcTmp"
    cd "$ubuntuLibcTmp"
    ${stdenv.cc.bintools.bintools}/bin/ar x ${ubuntuLibcDev} data.tar.zst
    tar --zstd -xf data.tar.zst ./usr/include
    cp -a ./usr/include $out/nix-sdk/usr/
    ln -s x86_64-linux-gnu/bits $out/nix-sdk/usr/include/bits
    ln -s x86_64-linux-gnu/gnu $out/nix-sdk/usr/include/gnu
    for dir in asm asm-generic drm linux misc mtd rdma scsi sound video xen; do
      if [ ! -e "$out/nix-sdk/usr/include/$dir" ] && [ -e "${glibcDev}/include/$dir" ]; then
        ln -s "${glibcDev}/include/$dir" "$out/nix-sdk/usr/include/$dir"
      fi
    done
    cd "$NIX_BUILD_TOP"

    rm -f $out/usr/bin/lldb*
    rm -f $out/usr/bin/lldb-server
    rm -f $out/usr/lib/liblldb.so*
    rm -rf $out/usr/local/lib/python3.12/dist-packages/lldb

    for tool in clang clang++ clang-17; do
      if [ -e "$out/usr/bin/$tool" ]; then
        mv "$out/usr/bin/$tool" "$out/usr/bin/$tool-real"
        makeWrapper "$out/usr/bin/$tool-real" "$out/usr/bin/$tool" \
          --add-flags "--sysroot=$out/nix-sdk" \
          --add-flags "--gcc-toolchain=${gccToolchain}" \
          --add-flags "-B${glibc}/lib" \
          --add-flags "-B${gccLibDir}" \
          --add-flags "-L${glibc}/lib"
      fi
    done

    mkdir -p $out/bin
    for tool in swift swift-build swift-package swiftc swift-driver clang clang++ clang-17 clangd lld llvm-ar llvm-cov llvm-profdata sourcekit-lsp; do
      if [ -e "$out/usr/bin/$tool" ]; then
        if [ "$tool" = swift ] || [ "$tool" = swift-build ] || [ "$tool" = swift-package ] || [ "$tool" = swiftc ] || [ "$tool" = swift-driver ]; then
          makeWrapper "$out/usr/bin/$tool" "$out/bin/$tool" \
            --set SDKROOT "$out/nix-sdk" \
            --prefix PATH : "${toolPath}" \
            --prefix LIBRARY_PATH : "${compilerLibraryPath}" \
            --prefix LD_LIBRARY_PATH : "${runtimeLibraryPath}:$out/usr/lib:$out/usr/lib/swift/linux"
        else
          makeWrapper "$out/usr/bin/$tool" "$out/bin/$tool" \
            --prefix PATH : "${toolPath}" \
            --prefix LIBRARY_PATH : "${compilerLibraryPath}" \
            --prefix LD_LIBRARY_PATH : "${runtimeLibraryPath}:$out/usr/lib:$out/usr/lib/swift/linux"
        fi
      fi
    done

    runHook postInstall
  '';

  doInstallCheck = true;
  installCheckPhase = ''
    runHook preInstallCheck
    $out/bin/swift --version
    $out/bin/swift-build --help >/dev/null
    runHook postInstallCheck
  '';

  meta = {
    description = "Official Swift 6.1.3 Linux toolchain repackaged for NixOS";
    homepage = "https://www.swift.org/install/linux/ubuntu/24_04/";
    license = lib.licenses.asl20;
    mainProgram = "swift";
    platforms = [ "x86_64-linux" ];
  };
}
