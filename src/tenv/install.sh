#!/bin/sh
set -e

REPO="tofuutils/tenv"
ARCH="$(uname -m | sed s/aarch/arm/ | sed s/x86_/amd/)"
FILTER=".assets[].browser_download_url | select(match(\"_${ARCH}.deb$\"))"

echo "Activating feature 'tenv' from ${REPO}"
echo "The provided version is: ${VERSION}"

if [[ "${VERSION}" == "latest" ]]; then
  VERSION=$(curl -sSL https://api.github.com/repos/${REPO}/releases/latest | jq -r .tag_name)
  echo "Resolved 'latest' to: ${VERSION}"
fi

RELEASE_URL="https://api.github.com/repos/${REPO}/releases/tags/${VERSION}"
RELEASE=$(curl -sSL ${RELEASE_URL} | jq -r "${FILTER}")

echo "Installing ${ARCH} deb package for ${REPO} @ ${VERSION}"

TMP=$(mktemp)
trap "rm -f ${TMP}" EXIT

curl -sL -o ${TMP} "${RELEASE}" \
  && dpkg -i "${TMP}"
