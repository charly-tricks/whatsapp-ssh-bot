#!/bin/bash

# 🔐 Verificar permisos root
if [ "$(id -u)" -ne 0 ]; then
  echo "❌ Este script debe ejecutarse como root"
  exit 1
fi

echo "🚀 Instalando whatsapp-ssh-bot..."

# 🌎 Detectar sistema operativo
if [ -f /etc/debian_version ]; then
  echo "✅ Sistema Debian/Ubuntu detectado"
  apt update && apt install curl git nodejs npm -y
elif [ -f /etc/redhat-release ]; then
  echo "✅ Sistema CentOS/RHEL detectado"
  yum update -y && yum install curl git -y
  curl -sL https://rpm.nodesource.com/setup_18.x | bash -
  yum install nodejs -y
else
  echo "❌ Sistema no compatible. Este script funciona en Ubuntu, Debian, CentOS y derivados"
  exit 1
fi

# 📥 Clonar repositorio
git clone https://github.com/charly-tricks/whatsapp-ssh-bot.git
cd whatsapp-ssh-bot

# 🔁 Mover archivos si están en subcarpetas
[ -f parte1/index.js ] && mv parte1/index.js.
[ -f parte1/admins.json ] && mv parte1/admins.json.

# 📋 Crear admins.json si no existe
if [! -f admins.json ]; then
  echo ""
  read -p "📲 Ingresá tu número de WhatsApp (formato internacional sin '+', ej: 5491123456789): " numero
  echo "[\"${numero}@c.us\"]"> admins.json
  echo "✅ ${numero} agregado como administrador"
fi

# 📦 Instalar dependencias
npm install

# 📸 Iniciar servicio QR
nohup node qr.js> /dev/null 2>&1 &

# 🔊 Ejecutar el bot
nohup node index.js> bot.log 2>&1 &

# 🌐 Mostrar link para QR
IP=$(curl -s ifconfig.me)
echo ""
echo "🎉 ¡Bot instalado y funcionando!"
echo "📸 Escaneá el QR en: http://$IP:8080/qr.png"
echo "📲 Tu número está autorizado para usar el bot"
echo "💬 Enviá comandos por WhatsApp como 'crear', 'listar', etc."
