const { Client, LocalAuth } = require('whatsapp-web.js');
const qrcode = require('qrcode-terminal');
const fs = require('fs');

const client = new Client({
  authStrategy: new LocalAuth(),
  puppeteer: { headless: true }
});

client.on('qr', (qr) => {
  console.log('📟 Escaneá este QR desde tu terminal:');
  qrcode.generate(qr, { small: true });

  const serveQR = require('./qr-generator');
  serveQR(qr);
});

client.on('ready', () => {
  console.log('✅ Bot listo y conectado.');
});

client.initialize();
