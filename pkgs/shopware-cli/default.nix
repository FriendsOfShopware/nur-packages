# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, lib
, fetchurl
, installShellFiles
, stdenvNoCC
}:
let
  shaMap = {
    x86_64-linux = "19ndqvksy1p77qsgrxxj1w0yv5yy7ndxab436n16lkwkmvg0hbvr";
    aarch64-linux = "1w0l905a5vbb9mc9p0mqwdv5w6kzpdz5x15hzvya34a44n14sjsv";
    x86_64-darwin = "149gbzfk17ncwbzrv0bp5bqm29i6p85s1qxjxzlmzndw5vrs2s17";
    aarch64-darwin = "06xbz6kkp8swjbhvbjj3jxn7869x28y0vjbz4bbvnfn0sphpdb55";
  };

  urlMap = {
    x86_64-linux = "https://github.com/FriendsOfShopware/shopware-cli/releases/download/0.4.38/shopware-cli_Linux_x86_64.tar.gz";
    aarch64-linux = "https://github.com/FriendsOfShopware/shopware-cli/releases/download/0.4.38/shopware-cli_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/FriendsOfShopware/shopware-cli/releases/download/0.4.38/shopware-cli_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/FriendsOfShopware/shopware-cli/releases/download/0.4.38/shopware-cli_Darwin_arm64.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "shopware-cli";
  version = "0.4.38";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./shopware-cli $out/bin/shopware-cli
  '';
  postInstall = ''
    installShellCompletion --cmd shopware-cli \
    --bash <($out/bin/shopware-cli completion bash) \
    --zsh <($out/bin/shopware-cli completion zsh) \
    --fish <($out/bin/shopware-cli completion fish)
  '';

  system = system;

  meta = {
    description = "Command line tool for Shopware 6";
    homepage = "https://sw-cli.fos.gg";
    license = lib.licenses.mit;

    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
