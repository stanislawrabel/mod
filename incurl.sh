#!/data/data/com.termux/files/usr/bin/bash
set -e

echo "📦 Spúšťam inštaláciu OTA DownloadeR pre Termux..."

# 🛠 Zmeniť repozitáre a nastaviť oprávnenia
termux-change-repo
termux-setup-storage
# Oprava apt a dpkg ak je zaseknuté
echo -e "${YELLOW}🔁 Fixing dpkg configuration...${RESET}"
yes N | dpkg --configure -a

# 🧱 Aktualizácie
pkg upgrade -y
pkg update -y

# 📦 Základné balíky
pkg install -y python python2 git tsu

# 🐍 Python knižnice
pip install wheel
pip install pycryptodome
pip3 install --upgrade requests pycryptodome git+https://github.com/R0rt1z2/realme-ota

# 📥 Stiahnutie hlavného skriptu z GitHubu
curl -sLo m.sh https://raw.githubusercontent.com/stanislawrabel/mod/main/m.sh
chmod +x m.sh

# 📁 Presun a alias (voliteľné)
mkdir -p ~/.local/bin
mv m.sh ~/.local/bin/m
# 🧩 Pridaj alias ak ešte neexistuje
if ! grep -q "alias ota=" ~/.bashrc; then
  echo "alias ota='~/.local/bin/m'" >> ~/.bashrc
  echo "✅ Alias 'ota' bol pridaný do ~/.bashrc"
fi


# 🔄 Načítanie aliasov
source ~/.bashrc || true

clear
echo -e "\n🎉 ${GREEN}Inštalácia dokončená!${RESET}"
echo -e "▶️  Spusť skript príkazom: ${YELLOW}odar${RESET}"



