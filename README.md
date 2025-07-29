# 🤖 WhatsApp SSH Bot

Bot autoinstalable vía VPS para controlar y ejecutar comandos vía WhatsApp.
Instalación ultra-rápida en 1 línea. Ideal para clientes, sysadmins y uso personal.

---

## 🚀 Instalación automática

Ejecutá esto en tu VPS como `root`:

```bash
curl -O https://raw.githubusercontent.com/charly-tricks/whatsapp-ssh-bot/main/ultra-instalador.sh && chmod +x ultra-instalador.sh && sudo./ultra-instalador.sh
```

El instalador hace todo:

- 🔧 Detecta tu sistema (Debian/CentOS)
- 📦 Instala Node.js + dependencias
- 📥 Clona el repositorio automáticamente
- 👤 Te pide tu número para ser administrador
- 📲 Lanza el bot + muestra el QR

---

*📸 Vinculación con WhatsApp*

- ✅ El QR se muestra en *terminal*
- 🌐 También disponible en navegador vía `http://IP_DEL_VPS:8080/qr.png`
- 🔐 El número que ingresás será el *administrador autorizado*

---

*✉️ Comandos disponibles*

Una vez vinculado, podés enviar comandos al bot vía WhatsApp:

- `crear usuario123`
- `listar`
- `eliminar usuario123`
- `renovar usuario123`
- `reboot`
- `ayuda`

📌 _Los comandos pueden variar según tu configuración._

---

*🛠️ Requisitos*

- VPS Linux (Debian/Ubuntu/CentOS)
- Node.js 20.x (se instala automáticamente)
- Puerto `8080` abierto para ver el QR (opcional)

---

*👨‍💼 ¿Quién administra?*

El número que ingresás al instalar el bot será el *administrador autorizado*.
Este número será agregado a `admins.json` con formato:

```json
["5491123456789@c.us"]
```

---

*🛡️ Seguridad*

El bot sólo responde a comandos de números autorizados.
Las acciones como crear/eliminar usuarios son internas, podés conectarlas a tus propios scripts o procesos SSH.

---

*🧑‍💻 Créditos*

Creado por [@charly-tricks](https://github.com/charly-tricks)
Inspirado en la idea de controlar tu VPS desde WhatsApp con estilo 😎

---

*📬 Contacto*

¿Querés tu propia versión personalizada?
¿Integración con clientes, panel web o facturación?
¡Contactame por GitHub o Telegram y lo armamos a medida! 📲
