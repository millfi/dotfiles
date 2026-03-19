{ lib
, stdenv
, fetchzip
, cmake
, ninja
, pkg-config
, gettext
, git
, swiftToolchain
, qt6
, fcitx5
, protobuf
}:

let
  gccToolchain = stdenv.cc.cc;
  src = fetchzip {
    url = "https://github.com/7ka-Hiira/hazkey/archive/refs/tags/0.2.1.tar.gz";
    hash = "sha256-3jS7kkGK4hlHv3B1Y03uqlDM2ewt8DcgvdaO0p4TPTY=";
  };

  azooKeyKanaKanjiConverter = fetchzip {
    url = "https://github.com/7ka-hiira/AzooKeyKanaKanjiConverter/archive/8b4befc273baafea5964ecf87d3bc36f2bbef68b.tar.gz";
    hash = "sha256-zbLTn+SPpI1CykO/htY1u18QiVJ34v0m8vlzewwCZN8=";
  };

  swiftAlgorithms = fetchzip {
    url = "https://github.com/apple/swift-algorithms/archive/87e50f483c54e6efd60e885f7f5aa946cee68023.tar.gz";
    hash = "sha256-cJfOxBB74V7ZE4g6OehYIdtmqYnSFIkJLpkxPo9jiUo=";
  };

  swiftCollections = fetchzip {
    url = "https://github.com/apple/swift-collections/archive/8c0c0a8b49e080e54e5e328cc552821ff07cd341.tar.gz";
    hash = "sha256-dBEFbP63d/wRWF5wB5dZYD8lOObVxta2zwnJrT/4rx8=";
  };

  swiftNumerics = fetchzip {
    url = "https://github.com/apple/swift-numerics/archive/e0ec0f5f3af6f3e4d5e7a19d2af26b481acb6ba8.tar.gz";
    hash = "sha256-EQwMU8VS95264hP3196tXEoURCuhSsrnlWvgxCottBU=";
  };

  swiftProtobuf = fetchzip {
    url = "https://github.com/apple/swift-protobuf/archive/102a647b573f60f73afdce5613a51d71349fe507.tar.gz";
    hash = "sha256-GWPmg+sWcnMQeehHTFboAYP7iXxNXcwLfvgZBsyrE1A=";
  };

  swiftTokenizers = fetchzip {
    url = "https://github.com/ensan-hcl/swift-tokenizers/archive/4a606f66e0cc4d7d9f0197649e812f7fc86a4c34.tar.gz";
    hash = "sha256-ZEj+eDa2xD3kn6ua3q+Ak2IRqUwWVfR97m3W63Vg+M8=";
  };

  jinja = fetchzip {
    url = "https://github.com/johnmai-dev/Jinja/archive/31c4dd39bcdc07eaa42a384bdc88ea599022b800.tar.gz";
    hash = "sha256-veIqE9wUoDAALKTx8eaO9RuDkwlHaN9YCJeO+WOhI7E=";
  };

  swiftyMarisa = fetchzip {
    url = "https://github.com/ensan-hcl/SwiftyMarisa/archive/91acc3cb0e747e0bd4b0e0813d42fb273d10e62f.tar.gz";
    hash = "sha256-gFHPrvazbzv3DgZdM4/06Gus86L7xau0gt2r5BSEi68=";
  };

  swiftArgumentParser = fetchzip {
    url = "https://github.com/apple/swift-argument-parser/archive/1.6.0.tar.gz";
    hash = "sha256-794G6xok42e6HyXocxQhX+cIJcqNhl3mW8IAvX4yUvk=";
  };

  llamaCpp = fetchzip {
    url = "https://github.com/7ka-hiira/llama.cpp/archive/10295c26a2a18c3c48863b179c5e6bf34a4057d1.tar.gz";
    hash = "sha256-23GOpDbrr6MgtjWTQxNn7M1+7l4/xJQNEMetVRgtt9U=";
  };

  kompute = fetchzip {
    url = "https://github.com/nomic-ai/kompute/archive/4565194ed7c32d1d2efa32ceab4d3c6cae006306.tar.gz";
    hash = "sha256-KeCp1DM9y8UukK6c8E9QEQ4hKAZ1GiNXWjcB2br35qM=";
  };

  azooKeyDictionaryStorage = fetchzip {
    url = "https://github.com/azooKey/azooKey_dictionary_storage/archive/e9796e052793c0d4ac304a27f9db4b7beb7cd43c.tar.gz";
    hash = "sha256-RjiHyqu8ZCaWlBmtfl3W644BHn1hF7bwx3w3kim9C1w=";
  };

  azooKeyEmojiDictionaryStorage = fetchzip {
    url = "https://github.com/azooKey/azooKey_emoji_dictionary_storage/archive/08f82252fb90ef8f0949a7e3c554e9e1787ce121.tar.gz";
    hash = "sha256-WsJ/2raKtvl3DHAmL1FDvNCr1H+kovGl3wbSKBh5UoI=";
  };
in
stdenv.mkDerivation rec {
  pname = "hazkey";
  version = "0.2.1";

  inherit src;

  nativeBuildInputs = [
    cmake
    ninja
    pkg-config
    gettext
    git
    swiftToolchain
    qt6.wrapQtAppsHook
  ];

  buildInputs = [
    fcitx5
    protobuf
    qt6.qtbase
    qt6.qttools
  ];

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
    "-DHAZKEY_SERVER_STATIC_SWIFT_STDLIB=OFF"
    "-DGGML_VULKAN=OFF"
  ];

  preBuild = ''
    export HOME="$TMPDIR/home"
    export XDG_CACHE_HOME="$HOME/.cache"
    export SWIFTPM_CACHE_PATH="$TMPDIR/swiftpm-cache"
    export CLANG_MODULE_CACHE_PATH="$TMPDIR/clang-module-cache"
    export SDKROOT="${swiftToolchain}/nix-sdk"
    export CC="${swiftToolchain}/bin/clang"
    export CXX="${swiftToolchain}/bin/clang++"
    export HAZKEY_SWIFT_GCC_TOOLCHAIN="${gccToolchain}"
    mkdir -p "$HOME" "$XDG_CACHE_HOME" "$SWIFTPM_CACHE_PATH" "$CLANG_MODULE_CACHE_PATH"
  '';

  postPatch = ''
    mkdir -p vendor
    cp -R ${azooKeyKanaKanjiConverter} vendor/AzooKeyKanaKanjiConverter
    cp -R ${swiftAlgorithms} vendor/swift-algorithms
    cp -R ${swiftCollections} vendor/swift-collections
    cp -R ${swiftNumerics} vendor/swift-numerics
    cp -R ${swiftProtobuf} vendor/swift-protobuf
    cp -R ${swiftTokenizers} vendor/swift-tokenizers
    cp -R ${jinja} vendor/Jinja
    cp -R ${swiftyMarisa} vendor/SwiftyMarisa
    cp -R ${swiftArgumentParser} vendor/swift-argument-parser
    chmod -R u+w vendor

    rm -rf vendor/AzooKeyKanaKanjiConverter/Sources/KanaKanjiConverterModuleWithDefaultDictionary/azooKey_dictionary_storage
    cp -R ${azooKeyDictionaryStorage} vendor/AzooKeyKanaKanjiConverter/Sources/KanaKanjiConverterModuleWithDefaultDictionary/azooKey_dictionary_storage
    chmod -R u+w vendor/AzooKeyKanaKanjiConverter/Sources/KanaKanjiConverterModuleWithDefaultDictionary/azooKey_dictionary_storage
    rm -rf vendor/AzooKeyKanaKanjiConverter/Sources/KanaKanjiConverterModuleWithDefaultDictionary/azooKey_emoji_dictionary_storage
    cp -R ${azooKeyEmojiDictionaryStorage} vendor/AzooKeyKanaKanjiConverter/Sources/KanaKanjiConverterModuleWithDefaultDictionary/azooKey_emoji_dictionary_storage
    chmod -R u+w vendor/AzooKeyKanaKanjiConverter/Sources/KanaKanjiConverterModuleWithDefaultDictionary/azooKey_emoji_dictionary_storage

    rm -rf hazkey-server/llama.cpp
    cp -R ${llamaCpp} hazkey-server/llama.cpp
    chmod -R u+w hazkey-server/llama.cpp
    mkdir -p hazkey-server/llama.cpp/ggml/src/ggml-kompute
    rm -rf hazkey-server/llama.cpp/ggml/src/ggml-kompute/kompute
    cp -R ${kompute} hazkey-server/llama.cpp/ggml/src/ggml-kompute/kompute

    rm -rf hazkey-server/azooKey_dictionary_storage
    cp -R ${azooKeyDictionaryStorage} hazkey-server/azooKey_dictionary_storage
    chmod -R u+w hazkey-server/azooKey_dictionary_storage
    rm -rf hazkey-server/azooKey_emoji_dictionary_storage
    cp -R ${azooKeyEmojiDictionaryStorage} hazkey-server/azooKey_emoji_dictionary_storage
    chmod -R u+w hazkey-server/azooKey_emoji_dictionary_storage

    substituteInPlace hazkey-server/Package.swift \
      --replace-fail '            url: "https://github.com/7ka-hiira/AzooKeyKanaKanjiConverter",' '            path: "../vendor/AzooKeyKanaKanjiConverter",' \
      --replace-fail '            branch: "8b4befc",' "" \
      --replace-fail '.package(url: "https://github.com/apple/swift-protobuf.git", from: "1.27.0"),' '.package(path: "../vendor/swift-protobuf"),'

    substituteInPlace vendor/AzooKeyKanaKanjiConverter/Package.swift \
      --replace-fail '    .package(url: "https://github.com/apple/swift-algorithms", from: "1.0.0"),' '    .package(path: "../swift-algorithms"),' \
      --replace-fail '    .package(url: "https://github.com/apple/swift-collections", from: "1.0.0"),' '    .package(path: "../swift-collections"),' \
      --replace-fail '    .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMajor(from: "1.0.0")),' '    .package(path: "../swift-argument-parser"),' \
      --replace-fail '    .package(url: "https://github.com/ensan-hcl/swift-tokenizers", from: "0.0.1")' '    .package(path: "../swift-tokenizers")' \
      --replace-fail 'dependencies.append(.package(url: "https://github.com/ensan-hcl/SwiftyMarisa", from: "0.0.1"))' 'dependencies.append(.package(path: "../SwiftyMarisa"))'

    substituteInPlace vendor/swift-tokenizers/Package.swift \
      --replace-fail '        .package(url: "https://github.com/apple/swift-argument-parser.git", .upToNextMinor(from: "1.4.0")),' '        .package(path: "../swift-argument-parser"),' \
      --replace-fail '        .package(url: "https://github.com/johnmai-dev/Jinja", .upToNextMinor(from: "1.1.0"))' '        .package(path: "../Jinja")'

    substituteInPlace vendor/swift-algorithms/Package.swift \
      --replace-fail '        .package(url: "https://github.com/apple/swift-numerics.git", from: "1.0.0"),' '        .package(path: "../swift-numerics"),'

    substituteInPlace vendor/Jinja/Package.swift \
      --replace-fail '        .package(url: "https://github.com/apple/swift-collections.git", from: "1.1.4")' '        .package(path: "../swift-collections")'

    substituteInPlace vendor/SwiftyMarisa/Package.swift \
      --replace-fail '            cxxSettings: [.headerSearchPath(".")]' '            cxxSettings: [.headerSearchPath("."), .unsafeFlags(["--sysroot", "${swiftToolchain}/nix-sdk"])]'

    substituteInPlace hazkey-server/build_swift.cmake \
      --replace-fail 'if(HAZKEY_SERVER_ZENZAI_TRAIT)' 'if(DEFINED ENV{SDKROOT} AND NOT "$ENV{SDKROOT}" STREQUAL "")
    list(APPEND SWIFT_COMMAND
        "-Xcc" "--sysroot=$ENV{SDKROOT}"
    )
endif()

if(DEFINED ENV{HAZKEY_SWIFT_GCC_TOOLCHAIN} AND NOT "$ENV{HAZKEY_SWIFT_GCC_TOOLCHAIN}" STREQUAL "")
    list(APPEND SWIFT_COMMAND
        "-Xcc" "--gcc-toolchain=$ENV{HAZKEY_SWIFT_GCC_TOOLCHAIN}"
    )
endif()

if(HAZKEY_SERVER_ZENZAI_TRAIT)'

    substituteInPlace vendor/AzooKeyKanaKanjiConverter/Package.swift \
      --replace-fail 'if checkObjcAvailability() {' 'if false && checkObjcAvailability() {'
  '';

  meta = {
    description = "LLM-based Japanese IME";
    homepage = "https://hazkey.hiira.dev/";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
    maintainers = [ ];
  };
}
