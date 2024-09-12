#! /bin/bash -xe

trap 'dnf -y clean all' EXIT

dnf -y install \
  jq

ARCH="$(uname -m|sed 's/aarch/arm/;s/x86_/amd/')"
LATEST_COSIGN_VERSION="$(curl https://api.github.com/repos/sigstore/cosign/releases/latest | jq -r .tag_name | tr -d v)"
LATEST_TENV_VERSION="$(curl https://api.github.com/repos/tofuutils/tenv/releases/latest | jq -r .tag_name)"

dnf -y install "https://github.com/sigstore/cosign/releases/latest/download/cosign-${LATEST_COSIGN_VERSION}-1.$(uname -m).rpm" 
dnf -y install "https://github.com/tofuutils/tenv/releases/download/${LATEST_TENV_VERSION}/tenv_${LATEST_TENV_VERSION}_${ARCH}.rpm" 
