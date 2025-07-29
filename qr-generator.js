const express = require('express');
const fs = require('fs');
const qrImage = require('qr-image');

module.exports = function (qrData) {
  const app = express();
  const port = 8080;

  const qrPng = qrImage.image(qrData, { type: 'png' });
  const stream = fs.createWriteStream('qr.png');
  qrPng.pipe(stream);

  app.get('/qr.png', (req, res) => {
    res.sendFile(__dirname + '/qr.png');
  });

  app.listen(port, '0.0.0.0', () => {
    console.log(`🌐 QR disponible en: http://${getIPv4()}:${port}/qr.png`);
  });

  function getIPv4() {
    const { networkInterfaces } = require('os');
    const nets = networkInterfaces();
    for (const name of Object.keys(nets)) {
      for (const net of nets[name]) {
        if (net.family === 'IPv4' && !net.internal) return net.address;
      }
    }
    return 'localhost';
  }
};
