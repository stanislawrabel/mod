#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive
dpkg --configure -a

# 📦 Update + upgrade bez otázok
pkg update -y
pkg upgrade -y --yes

# 🛠 Inštalácia balíkov bez potvrdenia
pkg install -y python python2 git tsu curl

# 🐍 Python knižnice
pip install -U wheel pycryptodome
pip3 install -U requests pycryptodome git+https://github.com/R0rt1z2/realme-ota

# ⬇️ Stiahnutie hlavného skriptu + dát
curl -sLo m.sh https://raw.githubusercontent.com/stanislawrabel/mod/main/m.sh
curl -sLo models.txt https://raw.githubusercontent.com/stanislawrabel/mod/main/models.txt
curl -sLo devices.txt https://raw.githubusercontent.com/stanislawrabel/mod/main/devices.txt

# 🗂 Presun a spustiteľné práva
chmod +x m.sh
mkdir -p ~/.local/bin
mv m.sh ~/.local/bin/m
mv models.txt ~/.local/bin/
mv devices.txt ~/.local/bin/

# 🔗 Alias
grep -qxF "alias m='~/.local/bin/m'" ~/.bashrc || echo "alias m='~/.local/bin/m'" >> ~/.bashrc

echo -e "\n\033[1;32m✅ Inštalácia dokončená!\033[0m"
echo -e "Spusti príkaz: \033[1;33mm\033[0m"

