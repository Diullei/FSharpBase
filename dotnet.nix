{ stdenv
, fetchurl
, libunwind
, openssl
, icu
, libuuid
, zlib
, curl
}:
  stdenv.mkDerivation rec {
    version = "2.1.402";
    netCoreVersion = "2.1.5";
    name = "dotnet-sdk-${version}";

    src = fetchurl {
      url = "https://dotnetcli.azureedge.net/dotnet/Sdk/${version}/dotnet-sdk-${version}-osx-x64.tar.gz";
      # use sha512 from the download page
      sha512 = "6abd86e3a340a6d529f6406be7a6db466bfe1daa2368631bd4e4c01216512c54ac4f2f710d1229e4f1550fd4332eb33ac1dd8a9dadd1947fa8b2981c2557cd2a";
    };


    unpackPhase = ''
      mkdir src
      cd src
      tar xvzf $src
    '';

    buildPhase = ''
      runHook preBuild
      echo -n "dotnet-sdk version: "
      ./dotnet --version
      runHook postBuild
    '';


    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      cp -r ./ $out
      ln -s $out/dotnet $out/bin/dotnet
      runHook postInstall
    '';

    meta = with stdenv.lib; {
      homepage = https://dotnet.github.io/;
      description = ".NET Core SDK ${version} with .NET Core ${netCoreVersion}";
    };
  }
