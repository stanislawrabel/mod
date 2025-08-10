#!/bin/bash
set -e

# 🛠 Automatický mód
export DEBIAN_FRONTEND=noninteractive
export TERM=xterm

# 📦 Aktualizácia repozitárov a balíkov
termux-change-repo
termux-setup-storage
pkg update -y && pkg upgrade -y

# 📌 Inštalácia závislostí
pkg install -y python python2 git tsu
pip install --upgrade pip wheel
pip install pycryptodome
pip3 install --upgrade requests pycryptodome git+https://github.com/R0rt1z2/realme-ota

# 🗂 Stiahnutie tvojho skriptu z GitHubu
cd ~
if [ -d "mod" ]; then
    rm -rf mod
fi
git clone https://github.com/stanislawrabel/mod.git
cd mod
chmod +x m.sh

clear
echo "✅ Inštalácia dokončená."
echo "▶ Spusti skript príkazom: ./m.sh"
