const express = require('express');
const app = express();

const songRoutes = require('./api/routes/songs');
const albumRoutes = require('./api/routes/albums');

app.use('/songs', songRoutes);
app.use('/albums', albumRoutes);

module.exports = app;