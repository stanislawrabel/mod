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

curl -sSL "$REPO/All_regions_m.sh" -o All_regions_m.sh
curl -sSL "$REPO/models.txt" -o models.txt
curl -sSL "$REPO/devices.txt" -o devices.txt

chmod +x m.sh

# 🛠️ Adding an alias for easy launch 
if ! grep -q "alias a=" ~/.bashrc; then
    echo "alias a='bash ~/All_regions_m.sh'" >> ~/.bashrc
    echo -e "\e[32m✅ Alias 'a' has been added.\e[0m"
fi
source ~/.bashrc
clear
exit