#!/bin/bash
set -e

# 🛠 Automatický mód
export DEBIAN_FRONTEND=noninteractive
export TERM=xterm

set -e

echo "📦 Updating Termux and installing dependencies..."
yes "" | pkg update -y
yes "" | pkg upgrade -y
echo N | dpkg --configure -a

pkg install -y python python2 git tsu curl
pip install wheel
pip install pycryptodome
pip3 install --upgrade requests pycryptodome git+https://github.com/R0rt1z2/realme-ota

echo "📥 Downloading scripts and data files..."
REPO="https://raw.githubusercontent.com/stanislawrabel/mod/main"

curl -sSL "$REPO/m.sh" -o m.sh
curl -sSL "$REPO/models.txt" -o models.txt
curl -sSL "$REPO/devices.txt" -o devices.txt

chmod +x m.sh

# 🛠️ Pridanie aliasu pre jednoduché spúšťanie
if ! grep -q "alias m=" ~/.bashrc; then
    echo "alias m='bash ~/m.sh'" >> ~/.bashrc
    echo -e "\e[32m✅ Alias 'm' bol pridaný. Na použitie zadaj: source ~/.bashrc\e[0m"
fi
source ~/.bashrc

echo -e "\n\033[1;32m✅ Installation complete!"\033[0m"
echo "▶ You can now run: \033[1;33mm\033[0m"
