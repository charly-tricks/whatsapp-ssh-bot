#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
  echo "❌ Este script debe ejecutarse como root"
  exit 1
fi

echo "🚀 Instalando whatsapp-ssh-bot..."

if [ -f /etc/debian_version ]; then
  echo "✅ Sistema Debian/Ubuntu detectado"
  apt update && apt install curl git -y
  curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
  apt install nodejs -y
elif [ -f /etc/redhat-release ]; then
  echo "✅ Sistema CentOS/RHEL detectado"
  yum update -y && yum install curl git -y
  curl -sL https://rpm.nodesource.com/setup_20.x | bash -
  yum install nodejs -y
else
  echo "❌ Sistema no compatible"
  exit 1
fi

[ -d whatsapp-ssh-bot ] && rm -rf whatsapp-ssh-bot
git clone https://github.com/charly-tricks/whatsapp-ssh-bot.git
cd whatsapp-ssh-bot

if [ ! -f admins.json ]; then
  echo ""
  read -p "📲 Ingresá tu número de WhatsApp (sin '+'): " numero
  echo "[\"${numero}@c.us\"]" > admins.json
  echo "✅ ${numero} agregado como administrador"
fi

npm install || echo "⚠️ Error: revisá que package.json esté presente."

nohup node index.js > bot.log 2>&1 &

IP=$(curl -4 -s ifconfig.me)
echo ""
echo "🎉 ¡Bot instalado y funcionando!"
echo "📸 Escaneá el QR en: http://${IP}:8080/qr.png"
echo "📲 Número autorizado para enviar comandos por WhatsApp"
