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
    x86_64-linux = "18lzlcnycp7hz4v4w9lghv5km3l3n81q70ja27fvqwgzhmki8k00";
    aarch64-linux = "0wx74mkbg96qc964lnbfa367n1c98cavnzl78hl1f97l7q8y22d6";
    x86_64-darwin = "0rnaxg7fkqb82yv0iqrgdnfy8vfmdydqzahv4pf85damqnw81qgd";
    aarch64-darwin = "0iablj9xnpsfqc48rw47ijpsrkvhypi94si9gbzcs6f48k8g2r14";
  };

  urlMap = {
    x86_64-linux = "https://github.com/FriendsOfShopware/shopware-cli/releases/download/0.4.51/shopware-cli_Linux_x86_64.tar.gz";
    aarch64-linux = "https://github.com/FriendsOfShopware/shopware-cli/releases/download/0.4.51/shopware-cli_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/FriendsOfShopware/shopware-cli/releases/download/0.4.51/shopware-cli_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/FriendsOfShopware/shopware-cli/releases/download/0.4.51/shopware-cli_Darwin_arm64.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "shopware-cli";
  version = "0.4.51";
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
