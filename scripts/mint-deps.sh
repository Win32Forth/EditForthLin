#!/usr/bin/env bash
# Install build dependencies for EditForthLin on Linux Mint / Debian / Ubuntu.
set -euo pipefail

if ! command -v apt-get >/dev/null 2>&1; then
  echo "mint-deps.sh expects apt-get (Linux Mint / Debian / Ubuntu)." >&2
  exit 1
fi

sudo apt-get update
sudo apt-get install -y \
  build-essential \
  cmake \
  ninja-build \
  nasm \
  python3 \
  pkg-config \
  qt6-base-dev \
  qt6-base-dev-tools \
  libgl1-mesa-dev

echo "EditForthLin Mint deps installed."
echo "Next: see docs/linux-mint-setup.md and PORT.md"
