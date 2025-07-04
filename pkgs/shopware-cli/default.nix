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
    x86_64-linux = "1zdabkkaycvyd27253vjcyjpd3fakcqhg17rrlicd4rds2sab882";
    aarch64-linux = "1f64b269d1456h1y9rqpac2d4yblqjdnjyvscahrylr2g0xzqw76";
    x86_64-darwin = "1cqkzvkqzy0xb23ngan0p5wbqbcjbczy0jvwr7pvp9zdb49s27q2";
    aarch64-darwin = "0xnpjfb0h7n33nw8pis0prpdj3xsja92nmgpqdi3f2hh32xh539z";
  };

  urlMap = {
    x86_64-linux = "https://github.com/shopware/shopware-cli/releases/download/0.6.17/shopware-cli_Linux_x86_64.tar.gz";
    aarch64-linux = "https://github.com/shopware/shopware-cli/releases/download/0.6.17/shopware-cli_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/shopware/shopware-cli/releases/download/0.6.17/shopware-cli_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/shopware/shopware-cli/releases/download/0.6.17/shopware-cli_Darwin_arm64.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "shopware-cli";
  version = "0.6.17";
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
