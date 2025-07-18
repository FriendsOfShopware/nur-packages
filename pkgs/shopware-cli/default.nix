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
    x86_64-linux = "089c2kzh5icci13qaqpww1j5sjwnp7r8nb7yn8930l25zhmnx47g";
    aarch64-linux = "03j5lhhi1shvcw80n9razhlsjh5r4iwkainhbajipycc3mssjhf3";
    x86_64-darwin = "1ywp8vpwggkk7lfh68yrjw6jcijcp3k9k8y32jdcpsml48dbnpjm";
    aarch64-darwin = "18cvs54y005rqnyf2nqjdb0vjggkcxl3mzjgymd7aj334016smra";
  };

  urlMap = {
    x86_64-linux = "https://github.com/shopware/shopware-cli/releases/download/0.6.22/shopware-cli_Linux_x86_64.tar.gz";
    aarch64-linux = "https://github.com/shopware/shopware-cli/releases/download/0.6.22/shopware-cli_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/shopware/shopware-cli/releases/download/0.6.22/shopware-cli_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/shopware/shopware-cli/releases/download/0.6.22/shopware-cli_Darwin_arm64.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "shopware-cli";
  version = "0.6.22";
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
