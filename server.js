require('dotenv').config();

const express = require('express');
const cors    = require('cors');
const path    = require('path');
const { testConnection } = require('./config/db');

const app  = express();
const PORT = process.env.PORT || 3000;

// ── Middleware ────────────────────────────────────────────────────────────────
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));

// ── API Routes ────────────────────────────────────────────────────────────────
app.use('/api/apartments', require('./routes/apartments'));

// ── Health check ──────────────────────────────────────────────────────────────
app.get('/api/health', (req, res) => {
  res.json({ status: 'ok', timestamp: new Date().toISOString() });
});

// ── SPA fallback — serve index.html for all non-API routes ───────────────────
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// ── Global error handler ──────────────────────────────────────────────────────
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ success: false, message: 'Internal server error' });
});

// ── Boot ──────────────────────────────────────────────────────────────────────
(async () => {
  await testConnection();
  app.listen(PORT, () => {
    console.log(`🏠  Real Estate App running at http://localhost:${PORT}`);
  });
})();
